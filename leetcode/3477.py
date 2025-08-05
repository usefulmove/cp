class Solution:
    def numOfUnplacedFruits(self, fruits: List[int], baskets: List[int]) -> int:
        bc = baskets

        def eval(fruit):
            for i in range(len(baskets)):
                if baskets[i] >= fruit:
                    bc[i] = 0
                    break

        for fruit in fruits:
            eval(fruit)

        return len(list(filter(lambda a: a != 0, bc)))
