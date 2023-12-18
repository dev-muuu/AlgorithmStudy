def solution(citations):
    
    left = 0
    right = 10000
    
    result = 0
    
    while left <= right:
        mid = (left+right)//2
        up = 0
        down = 0
        for i in citations:
            if i >= mid:
                up += 1
            else:
                down += 1
        if up >= mid and down <= mid:
            result = max(result, mid)
            left = mid + 1
        else:
            right = mid-1
    
    return result

def reference(citations):
    citations = sorted(citations)
    l = len(citations)
    for i in range(l):
        if citations[i] >= l-i:
            return l-i
    return 0
