all: app app-opt

start.ll: start.c
	clang -emit-llvm -S $^

sim.ll: sim.c
	clang -emit-llvm -S $^

app.ll: app.c
	clang -emit-llvm -S $^

app-opt.ll: app.c
	clang -emit-llvm -S $^ -o $@ -O2

full.bc: start.ll sim.ll app.ll
	llvm-link $^ -o full.bc

app: app.ll start.c sim.c
	clang $^ -lSDL2 -o $@

app-opt: app-opt.ll start.c sim.c
	clang $^ -lSDL2 -o $@ -O2

clean:
	rm -f app app-opt *.ll full.bc

.PHONY: all clean
