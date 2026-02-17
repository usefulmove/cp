from itertools import permutations

class Solution:
    def readBinaryWatch(self, turnedOn: int) -> List[str]:
        LEDS = 10  # ignoring AM/PM bit

        # generate bit permutations
        perms = ( f'{n:010b}' for n in range(2**LEDS) if n.bit_count() == turnedOn )

        def getTime(bits: str) -> str:
            hours = int(bits[:4], 2)
            mins = int(bits[4:], 2)

            shours = f'{hours}' if 0 <= hours < 12 else 'xx'
            smins = f'{mins:02}' if 0 <= mins < 60 else 'xx'

            return f'{shours}:{smins:02}'

        # return valid times
        return [ getTime(bits) for bits in perms if 'x' not in getTime(bits) ]
