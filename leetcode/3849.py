class Solution:
    def maximumXor(self, s: str, t: str) -> str:
        t_ones = t.count('1')
        t_zeros = len(t) - t_ones
        out = ""

        for b in s:
            match b:
                case '0':
                    if t_ones > 0:
                        out += '1'
                        t_ones -= 1
                    else:
                        out += '0'
                        t_ones -= 1
                case '1':
                    if t_zeros > 0:
                        out += '1'
                        t_zeros -= 1
                    else:
                        out += '0'
                        t_ones -= 1

        return out


#class Solution:
#    def maximumXor(self, s: str, t: str) -> str:
#        def recur(sbits: str = s, tbits: str = t, out: str = "") -> str:
#            if not tbits:
#                return out
#            sbit, *srest = sbits
#            ind = len(out)
#            match sbit:
#                case '0':
#                    if '1' in tbits:
#                        return recur(srest, tbits.replace('1', '', 1), out + '1')
#                    else:
#                        return recur(srest, tbits[1:], out + '0')
#                case '1':         
#                    if '0' in tbits:
#                        return recur(srest, tbits.replace('0', '', 1), out + '1')
#                    else:
#                        return recur(srest, tbits[1:], out + '0')
#
#        return recur()
