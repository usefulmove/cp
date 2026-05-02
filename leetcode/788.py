class Solution:
    def rotatedDigits(self, n: int) -> int:
        def rotate(digit: int) -> int:
            match digit:
                case 2:
                    return 5
                case 5:
                    return 2
                case 6:
                    return 9
                case 9:
                    return 6
                case n if n in [0,1,8]:
                    return n
                case _:
                    return -1

        def rotate_digits(n: int) -> int:
            acc = ""

            for c in str(n):
                digit = int(c)
                rotated_digit = rotate(digit)
                if rotated_digit == -1:
                    return -1
                acc = acc + str(rotated_digit)

            return int(acc)

        def is_valid(n: int) -> bool:
            if n < 0:
                return False
            for c in str(n):
                digit = int(c)
                if rotate(digit) == -1:
                    return False
            return True

        def is_good(n: int) -> bool:
            rotated_n = rotate_digits(n)
            return is_valid(rotated_n) and rotated_n != n

        goods = 0
        for a in range(1, n+1):
            if is_good(a):
                goods += 1

        return goods
