class Solution:
    def intToRoman(self, num: int) -> str:

        roman_digit = list()
        index = 0
        ROMAN_NOTATION = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"),
                  (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"),
                  (5, "V"), (4, "IV"), (1, "I")]
        for notation in ROMAN_NOTATION:
            if num == 0 :
                break

            count = num // notation[0]
            num = num % notation[0]

            roman_digit.append(notation[1] * count)
        return ''.join(roman_digit)

for i in range(40, 0, -1):
    print(f"{i} = {Solution().intToRoman(i)}")

