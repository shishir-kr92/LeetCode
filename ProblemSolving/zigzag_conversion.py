# https://leetcode.com/problems/zigzag-conversion/solutions/

class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if len(s) == 0:
            return 0
        str_list = []
        i = j = 0
        direction = 'DOWN'

        for c in s:
            if i == (numRows - 1):
                direction = 'CROSS'

            if direction == 'DOWN':
                i

        return ''

