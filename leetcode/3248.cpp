#include <numeric>
#include <string>
#include <vector>

int finalPositionOfSnake(int n, const std::vector<std::string> &commands) {
    return std::accumulate(commands.begin(), commands.end(), 0,
                           [n](int pos, const std::string &cmd) {
                               if (cmd == "UP") return pos - n;
                               if (cmd == "DOWN") return pos + n;
                               if (cmd == "RIGHT") return pos + 1;
                               if (cmd == "LEFT") return pos - 1;
                               return pos;
                           });
}
