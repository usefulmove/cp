def square_of_sum(number):
    total = sum(range(number + 1))
    return total * total


def sum_of_squares(number):
    return sum([ a * a for a in range(number + 1) ])


def difference_of_squares(number):
    return square_of_sum(number) - sum_of_squares(number)



square_of_sum(5)
square_of_sum(100)
sum_of_squares(5)
difference_of_squares(5)
