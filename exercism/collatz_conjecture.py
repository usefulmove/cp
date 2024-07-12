def steps(number, count=0):
    if number <= 0:
        raise ValueError("Only positive integers are allowed")

    if number == 1:
        return count

    if 0 == number % 2:
        return steps(number/2, count+1)
    else:
        return steps(3*number+1, count+1)
