class Solution:
    def __init__(self):
        self.LOOKUP_DICT = dict()

    def twoSum(self, nums, target, ignoreIndex):
        result = set()
        for index, num in enumerate(nums):
            tmp = target - num
            if index == ignoreIndex:
                continue
            if tmp in self.LOOKUP_DICT and index != self.LOOKUP_DICT[tmp] and ignoreIndex != self.LOOKUP_DICT[tmp]:
                result.add(tuple(nums[index], tmp))
        return result

    def threeSum(self, nums: List[int]) -> List[List[int]]:
        result = set()
        sortedList = sorted(nums)
        for index, num in enumerate(sortedList):
            self.LOOKUP_DICT[num] = index

        for currentIndex, currentNum in enumerate(sortedList):
            tmpTarget = 0 - currentNum
            if currentNum > 0 :
                break
            elif currentIndex > 0  and currentNum == sortedList[currentIndex - 1]:
                continue
            else:
                for res in self.twoSum(nums, tmpTarget, currentIndex):
                    result.add(tuple(sorted((num, *res))))
        return list(result)

'''
[-1,0,1,2,-1,-4]

[-4, -1, -1, 0, 1, 2]

-4

'''