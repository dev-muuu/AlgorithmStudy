import sys
input = sys.stdin.readline()

data = list(map(int,input.split()))
g = [i+1 for i in range(8)]

if g == data:
    print("ascending")
elif sorted(g,reverse=True) == data:
    print("descending")
else:
    print("mixed")
