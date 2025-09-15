class Solution:
    def canBeTypedWords(self, text: str, brokenLetters: str) -> int:
        def canBeTyped(word: str) -> bool:
            return all(not c in word for c in brokenLetters)
        
        return len(list(filter(canBeTyped, text.split())))
