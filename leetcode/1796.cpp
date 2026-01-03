#include <iostream>
#include <ranges>
#include <set>
#include <string>

int secondHighest(std::string s) {
  auto digits = s | std::views::filter([](char c) { return std::isdigit(c); }) |
                std::views::transform([](char c) { return c - '0'; });

  std::set<int> unique_digits(digits.begin(), digits.end());

  if (std::ranges::distance(unique_digits) < 2)
    return -1;

  return *std::prev(unique_digits.end(), 2);
}

int main() {
  std::cout << secondHighest("dfa12321afd") << "\n"; // => 2
  std::cout << secondHighest("abc1111") << "\n";     // => -1
}
