#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <unordered_map>
#include <vector>

using namespace std;

static constexpr size_t MAX_LEN = 5;
static constexpr size_t MAX_UNIQUE = 200000;
static constexpr uint64_t MAX_EVENTS = 1000000;
static size_t uniquePatterns = 0;
static constexpr unsigned long long SAVE_INTERVAL = 100000;

using Counts = unordered_map<string, uint64_t>;
static array<Counts, MAX_LEN> counts;
static array<string, MAX_LEN> window;
static size_t windowSize = 0;
static uint64_t totalEvents = 0;
static bool finished = false;

static void dumpStats() {
  FILE* out = fopen("stats.txt", "w");
  if (!out) {
    perror("fopen stats.txt");
    return;
  }

  fprintf(out, "Total events: %llu\n\n", (unsigned long long)totalEvents);

  for (size_t len = 1; len <= MAX_LEN; ++len) {
    vector<pair<string, uint64_t>> items(counts[len - 1].begin(),
                                         counts[len - 1].end());

    sort(items.begin(), items.end(),
         [](const auto& a, const auto& b) { return a.second > b.second; });

    fprintf(out, "=== Patterns of length %zu ===\n", len);

    size_t limit = min<size_t>(30, items.size());
    for (size_t i = 0; i < limit; ++i) {
      fprintf(out, "%llu\t%s\n", (unsigned long long)items[i].second,
              items[i].first.c_str());
    }

    fprintf(out, "\n");
  }

  fclose(out);
}

extern "C" void funcStartLogger(const char*) {}

extern "C" void UserOperandLogger(const char* user, const char* operand) {
  ++totalEvents;

  std::string event = std::string(user) + " <- " + operand;

  if (windowSize < MAX_LEN) {
    window[windowSize++] = event;
  } else {
    for (size_t i = 1; i < MAX_LEN; ++i) {
      window[i - 1] = window[i];
    }
    window[MAX_LEN - 1] = event;
  }

  std::string pattern;

  for (size_t len = 1; len <= windowSize; ++len) {
    const std::string& current = window[windowSize - len];

    if (len == 1) {
      pattern = current;
    } else {
      pattern = current + " || " + pattern;
    }

    auto& table = counts[len - 1];
    auto it = table.find(pattern);

    if (it != table.end()) {
      ++it->second;
    } else if (uniquePatterns < MAX_UNIQUE) {
      table.emplace(pattern, 1);
      ++uniquePatterns;
    }
  }

  if (totalEvents % SAVE_INTERVAL == 0) {
    dumpStats();
  }
}

__attribute__((constructor)) static void initLogger() { atexit(dumpStats); }
