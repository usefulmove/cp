from collections import Counter

class Solution:
    def minimumPushes(self, word: str) -> int:
        counts = list(Counter(word).items())
        counts = sorted(counts, key=lambda a: a[1], reverse=True)

        def f(acc, e):
            rank = e[0]
            count = e[1][1]

            match rank:
                case rank if rank <= 8:
                    pushes = count
                case rank if rank <= 8*2:
                    pushes = count * 2
                case rank if rank <= 8*3:
                    pushes = count * 3
                case _:
                    pushes = count * 4
                
            return acc + pushes
        
        return reduce(f, list(enumerate(counts, 1)), 0)
