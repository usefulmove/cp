#include <print>

using namespace std;

int tribonacci(int n, int a = 0, int b = 1, int c = 1) {
    switch (n) {
        case 0: return a;
        case 1: return b;
        case 2: return c;
        default: return tribonacci(n - 1, b, c, a + b + c);
    }
}

int main() {
    println("tribonacci(4) = {}", tribonacci(4));   // => 4
    println("tribonacci(25) = {}", tribonacci(25)); // => 1389537

    return 0;
}
