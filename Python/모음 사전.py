def solution(word):
    
    w = list("AEIOU")
          
    global answer
    answer = 0
    
    global count
    count = -1
    
    def dfs(str):
        
        global count
        count += 1
        
        if word == str:
            global answer
            answer = count
        if len(str) == 5:
            return
        for i in w:
            dfs(str+i)
    
    dfs("")
    
    return answer
