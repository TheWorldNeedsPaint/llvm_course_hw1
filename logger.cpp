#include <llvm/IR/Instruction.h>
#include <llvm/Support/Casting.h>

#include <vector>

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Plugins/PassPlugin.h"

using namespace llvm;

struct MyModPass : public PassInfoMixin<MyModPass> {
  Type* voidType;
  Type* int8PtrTy;
  Type* int32Ty;
  Type* int64Ty;

  bool insertFuncStartLog(Module& M, Function& F, IRBuilder<>& builder) {
    // Prepare funcStartLogger function
    ArrayRef<Type*> funcStartParamTypes = {int8PtrTy};
    FunctionType* funcStartLogFuncType =
        FunctionType::get(voidType, funcStartParamTypes, false);
    FunctionCallee funcStartLogFunc =
        M.getOrInsertFunction("funcStartLogger", funcStartLogFuncType);

    // Insert a call to funcStartLogger function in the function begin
    BasicBlock& entryBB = F.getEntryBlock();
    builder.SetInsertPoint(&entryBB.front());
    Value* funcName = builder.CreateGlobalString(F.getName());
    Value* args[] = {funcName};
    builder.CreateCall(funcStartLogFunc, args);

    return true;
  }

  bool insertUserOperandLog(Module& M, Function& F, IRBuilder<>& builder) {
    ArrayRef<Type*> userOperandParamTypes = {int8PtrTy, int8PtrTy};
    FunctionType* userOperandLogFuncType =
        FunctionType::get(voidType, userOperandParamTypes, false);
    FunctionCallee userOperandLogFunc =
        M.getOrInsertFunction("binOptLogger", userOperandLogFuncType);

    std::vector<Instruction*> instructions;

    for (BasicBlock& B : F) {
      for (Instruction& I : B) {
        instructions.push_back(&I);
      }
    }

    bool Inserted = false;
    for (auto* I : instructions) {
      if (!isa<PHINode>(I)) {
        std::vector<std::pair<Instruction*, Instruction*>> pairs;
        for (Value* op : I->operands()) {
          if (auto* operand = dyn_cast<Instruction>(op)) {
            if (!isa<PHINode>(operand)) {
              pairs.push_back({I, operand});
            }
          }
        }
        if (pairs.empty()) {
          continue;
        }
        builder.SetInsertPoint(I);
        Value* instructionName = builder.CreateGlobalString(I->getOpcodeName());
        for (auto [instruction, operand] : pairs) {
          Value* operandName =
              builder.CreateGlobalString(operand->getOpcodeName());

          builder.CreateCall(userOperandLogFunc,
                             {instructionName, operandName});
          Inserted = true;
        }
      }
    }
    return Inserted;
  }

  PreservedAnalyses run(Module& M, ModuleAnalysisManager& AM) {
    outs() << "[Module] " << M.getName() << '\n';

    // Prepare builder for IR modification
    LLVMContext& Ctx = M.getContext();
    IRBuilder<> builder(Ctx);
    voidType = Type::getVoidTy(Ctx);
    int8PtrTy = PointerType::getUnqual(Ctx);
    int32Ty = Type::getInt32Ty(Ctx);
    int64Ty = Type::getInt64Ty(Ctx);

    for (auto& F : M) {
      outs() << "[Function] " << F.getName() << " (arg_size: " << F.arg_size()
             << ")\n";

      if (F.isDeclaration()) continue;

      if (insertFuncStartLog(M, F, builder)) {
        outs() << "insertFuncStartLog done\n";
      }

      if (insertUserOperandLog(M, F, builder)) {
        outs() << "insertUserOperandLog done\n";
      }

      bool verif = verifyFunction(F, &outs());
      outs() << "[VERIFICATION] " << (verif ? "FAIL\n\n" : "OK\n\n");
    }
    outs() << '\n';
    return PreservedAnalyses::none();
  };
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder& PB) {
    PB.registerOptimizerLastEPCallback(
        [](ModulePassManager& MPM, auto, auto) { MPM.addPass(MyModPass{}); });
  };

  return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
}

/* When a plugin is loaded by the driver, it will call this entry point to
obtain information about this plugin and about how to register its passes.
*/
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}
