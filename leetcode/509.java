class Solution {
    public int fib(int n) {
        return fib2(n, 0, 1);
    }
    
    public static int fib2(int n, int a, int b) {
        if (n == 0) {
            return a;
        } else if (n == 1) {
            return b;
        } else {
            return fib2(n-1, b, a+b);
        }
    }    
}
