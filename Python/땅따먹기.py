def solution(land):
    
    dp = land[0]
    for i in range(1, len(land)):
        
        candidate = sorted(dp, reverse=True)
        candidateIndex = dp.index(candidate[0])
        
        for j in range(4):
            preMax = candidate[1] if candidateIndex == j else candidate[0]
            dp[j] = preMax + land[i][j]
        
    return max(dp)
