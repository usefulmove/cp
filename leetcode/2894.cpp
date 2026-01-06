class Solution {
  public:
    int differenceOfSums(int n, int m) {
        auto recur = [m](this auto &&self, int n, int non = 0,
                         int div = 0) -> int {
            if (n == 0)
                return non - div;

            return (n % m == 0) ? self(n - 1, non, div + n)
                                : self(n - 1, non + n, div);
        };

        return recur(n);
    }
};
