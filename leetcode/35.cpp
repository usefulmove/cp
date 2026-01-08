int searchInsert(vector<int> nums, int target) {
    int bottom = 0;
    int middle;
    int top = nums.size() - 1;

    while (bottom <= top) {
        middle = (bottom + top) / 2;
        const int num = nums[middle];

        if (num == target)
            break;

        if (bottom == top) {
            if (num < target)
                middle += 1;
            break;
        }

        if (num < target) {
            bottom = middle + 1;
        } else {
            top = middle - 1;
        }
    }

    return middle;
}
