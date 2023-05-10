class Solution:
    def romanToInt(self, s: str) -> int:
        ROMAN_NOTATION = { 'M':1000,
                           'D':500,
                           'C':100,
                           'L':50,
                           'X':10,
                           'V':5,
                           'I':1
        }
        sum = 0
        for index, ch in enumerate(s):
            if index + 1 < len(s) and ROMAN_NOTATION[s[index]] < ROMAN_NOTATION[s[index + 1]]:
                sum -= ROMAN_NOTATION[ch]
            else:
                sum += ROMAN_NOTATION[ch]
        return sum

l = ['III', 'LVIII', 'MCMXCIV']
for i in l:
    print(Solution().romanToInt(i))