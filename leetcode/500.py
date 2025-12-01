class Solution:
    def findWords(self, words: List[str]) -> List[str]:
        hash_map = dict()

        for rowid, group in enumerate(("qwertyuiop", "asdfghjkl", "zxcvbnm")):
            for c in group:
                hash_map[c] = rowid

        def is_single_row(word: str) -> bool:
            s = set()

            for c in word:
                s.add(hash_map[c.lower()])
            
            return len(s) == 1

        return [word for word in words if is_single_row(word)]
