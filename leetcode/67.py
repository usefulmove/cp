class Solution:
    def addBinary(self, a: str, b: str) -> str:
        n: int = max(len(a), len(b)) + 1

        def recur(sa: str, sb: str, acc: str = "", carry: str = "0"):
            if not sa:
                out = acc.rstrip('0')
                return out if out else "0"

            bit_a, *rest_a = sa
            bit_b, *rest_b = sb

            match int(bit_a) + int(bit_b) + int(carry):
                case 0:
                    bit = carry = "0"
                case 1:
                    bit = "1"
                    carry = "0"
                case 2:
                    bit = "0"
                    carry = "1"
                case 3:
                    bit = carry = "1"

            return recur(rest_a, rest_b, acc + bit, carry)

        return recur(a.zfill(n)[::-1], b.zfill(n)[::-1])[::-1]

ans = Solution()
print(f"{ans.addBinary("11", "1") = }")      # => "100"
print(f"{ans.addBinary("1010", "1011") = }") # => "10101"
print(f"{ans.addBinary("0", "0") = }")       # => "0"
