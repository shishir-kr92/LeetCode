#https://leetcode.com/problems/longest-common-prefix/description/
class Solution:
    def getCommonPrefix(self, str1,str2):
        index = 0
        itrRange = min(len(str1), len(str2))
        while index < itrRange:
            if str1[index] != str2[index]:
                break
            index += 1
        return str1[0:index]

    def longestCommonPrefix(self, strs: List[str]) -> str:
        commonPrefix = strs[0]
        for st in strs[1:]:
            commonPrefix = self.getCommonPrefix(commonPrefix, st)
        return commonPrefix
