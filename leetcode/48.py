def rotate(matrix):
    nrows = len(matrix)
    ncols = len(matrix[0])

    def swap(i, j, a, b):
        temp = matrix[i][j]
        matrix[i][j] = matrix[a][b]
        matrix[a][b] = temp

    # transpose
    for i in range(nrows):
        for j in range(ncols):
            if i < j:
                swap(i, j, j, i)

    # reverse columns
    for i in range(nrows):
        for j in range(ncols//2):
            swap(i, j, i, ncols-1-j)

    print(matrix)


rotate([[1,2,3],[4,5,6],[7,8,9]])
rotate([[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]])
