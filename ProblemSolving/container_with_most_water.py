#https://leetcode.com/problems/container-with-most-water/solutions/
from math import sqrt



class Solution:
    def get_bar_length(self, x, y):
        return int(sqrt(((x[0] - y[0]) ** 2 + (x[1] - y[1]) ** 2)))

    def maxArea(self, height: list[int]) -> int:
        max_area = 0
        left = 0
        right = len(height) - 1

        while left != right:
            width = right - left
            max_area = max(max_area, min(height[left], height[right]) * width)

            if height[left] > height[right]:
                right -= 1
            else:
                left += 1
        return max_area


    def max_area_brute_force(self, height) -> int:
        max_area = 0
        for i in range(len(height)):
            for j in range(i + 1, len(height)):
                l1 = self.getBarLength((i, 0), (i, height[i]))
                l2 = self.getBarLength((j, 0), (j, height[j]))

                length = min(l1, l2)
                breadth = j - i

                max_area = max(max_area, length * breadth)
        return max_area
