#include <functional>

class Solution {
  public:
    int fib(int n) {
        std::function<int(int, int, int)> fib2 = [&](int n, int a, int b) -> int {
            if (n == 0) return a;
            if (n == 1) return b;
            return fib2(n - 1, b, a + b);
        };
    
        return fib2(n, 0, 1);
    }
};
