class Solution {
  public:
    string largestEven(string s) {
        if (s.empty())
            return "";

        if (s.back() == '2')
            return std::string(s);

        return largestEven(s.substr(0, s.size() - 1));
    }
};
