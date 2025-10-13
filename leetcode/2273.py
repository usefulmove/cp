'''
Iterate through the list and check the first two words. If they are anagrams, remove the second and re-enter the iteration. If not, add the first to the accumulator and continue iterating through the rest. When you have reached the last word, add it to the accumulator and return the list of accumulated words.
'''

class Solution:
    def are_anagrams(self, word_a: str, word_b: str) -> bool:
        return sorted(word_a) == sorted(word_b)

    def removeAnagrams(self, words: List[str], acc: List[str] = []) -> List[str]:
        if len(words) == 1:
            return acc + [words[0]]

        word_a: str = words[0]
        word_b: str = words[1]

        if self.are_anagrams(word_a, word_b):
            return self.removeAnagrams([word_a] + words[2:], acc)
        else:
            return self.removeAnagrams(words[1:], acc + [word_a])
