class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        sorted_potions: int = sorted(potions)
        num_potions: int = len(potions)

        def find_potions_ind(spell: int) -> int:
            left: int = 0
            right: int = num_potions - 1

            while left <= right:
                mid: int = floor((left + right) / 2)
                val: int = sorted_potions[mid]

                if (val * spell) >= success:
                    right = mid - 1
                else:
                    left = mid + 1

                return left

        return list(map(lambda s: num_potions - find_potions_ind(s), spells))
