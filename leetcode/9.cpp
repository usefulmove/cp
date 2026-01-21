class Solution {
  public:
    bool isPalindrome(int x) {
        string s = to_string(x);
        string r = s;

        ranges::reverse(r);

        return s == r;
    }
};
