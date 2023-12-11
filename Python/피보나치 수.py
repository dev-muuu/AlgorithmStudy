import sys
sys.setrecursionlimit(200000) # maximum recursion depth exceed error 방지

def solution(n):
    
    f_array = [None] * (n+1)
    f_array[0] = 0
    f_array[1] = 1
    
    def f(k):
        if f_array[k] == None:
            f_array[k] = (f(k-1) + f(k-2)) % 1234567
        return f_array[k]
    
    return f(n)
