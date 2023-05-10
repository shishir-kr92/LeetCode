class Solution:
    def convertToList(self, string):
        start  = 0
        subPatternList = list()
        for curIndex in range(len(string)):
            if string[curIndex].isupper() and start != curIndex:
                subPatternList.append(string[start: curIndex])
                start = curIndex
        subPatternList.append(string[start: curIndex + 1])
        return subPatternList

    def checkQuery(self, query,  pattern ):
        counter = 0
        subQueryList = self.convertToList(query)
        if len(subQueryList) != len(pattern):
            return False

        for index in range(len(subQueryList)):
            print(subQueryList[index], pattern[index])
            if not subQueryList[index].startswith(pattern[index]):
                return False
        return True

    # def camelMatch(self, queries: List[str], pattern: str) -> List[bool]:
    def camelMatch(self, queries, pattern) :
        subPatternList = self.convertToList(pattern)
        print( [self.checkQuery(query, subPatternList) for query in queries ])

print("Test2*************")
Solution().camelMatch(["FooBar","FooBarTest","FootBall","FrameBuffer","ForceFeedBack"], 'FB')
print("Test2*************")
Solution().camelMatch(["CompetitiveProgramming","CounterPick","ControlPanel"], 'CooP')

