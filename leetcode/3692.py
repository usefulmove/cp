from collections import Counter

class Solution:
    def majorityFrequencyGroup(self, s: str) -> str:
        counts = sorted(
            list(Counter(s).items()),
            key=lambda c: c[1],
            reverse=True
        )

        freqs = {}
        for c in counts:
            char, freq = c
            if freq in freqs:
                freqs[freq] += [char]
            else:
                freqs[freq] = [char]

        sorted_freqs = sorted(
            list(freqs.items()),
            key=lambda f: (len(f[1]), f[0]),
            reverse=True
        )

        mfcs = (sorted_freqs[0])[1]

        return ''.join(mfcs)
