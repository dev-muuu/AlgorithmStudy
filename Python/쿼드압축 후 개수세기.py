def solution(arr):
    
    answer = [0,0]
    
    def allSatisfy(row, col, length, value):
        for i in range(row, row+length):
            for j in range(col, col+length):
                if arr[i][j] != value:
                    return False
        return True
    
    def dfs(row, col, length):
        
        if allSatisfy(row, col, length, 1):
            answer[1] += 1
        elif allSatisfy(row, col, length, 0):
            answer[0] += 1
        else :
            newLen = int(length/2)
            for (i, j) in [(row, col),(row+newLen, col),(row, col+newLen),(row+newLen, col+newLen)]:
                dfs(i, j, newLen)
            
    dfs(0,0,len(arr))
    
    return answer
