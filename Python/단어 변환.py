def solution(begin, target, words):
    
    maxSize = 2**63-1
    
    def isValid(a, b):
        
        a = list(a)
        b = list(b)
        
        diff = 0
        for i in range(len(a)):
            if a[i] != b[i]:
                diff += 1
            if diff > 1 :
                return False
        return True
    
    global answer
    answer = maxSize
    
    global visit
    visit = [False] * len(words)
    
    def dfs(w, depth):
        
        if w == target:
            global answer
            answer = min(answer, depth)
            return
        if depth >= answer:
            return
        
        for (i, temp) in enumerate(words):
            global visit
            if visit[i]:
                continue
            if isValid(temp, w):
                visit[i] = True
                dfs(temp, depth+1)
                visit[i] = False
    
    dfs(begin, 0)
    
    if answer == maxSize:
        return 0
    return answer
