import functools

def comparator(a,b):
    if a+b > b+a :
        return 1
    elif a+b < b+a:
        return -1
    else:
        return 0

def solution(numbers):
    n = list(map(str,numbers))
    n = sorted(n, key=functools.cmp_to_key(comparator), reverse=True)
    value = "".join(n)
    return "0" if value[0] == "0" else value
