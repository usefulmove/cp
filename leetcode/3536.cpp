#include <functional>
#include <iostream>

int maxProduct(int n) {
    auto recur = [](this auto &&self, int n, int a, int b) {
        if (n == 0) {
            return a * b;
        }

        int quotient = n / 10;
        int digit = n % 10;

        if (digit >= b) {
            return self(quotient, b, digit);
        }

        if (digit >= a) {
            return self(quotient, digit, b);
        }

        return self(quotient, a, b);
    };

    return recur(n, 0, 0);
}

int main() {
    std::cout << maxProduct(31) << "\n";
    std::cout << maxProduct(22) << "\n";
    std::cout << maxProduct(124) << "\n";

    return 0;
}
