def solution(str1, str2):
    
    def generate(str):
        str = list(str)
        result = {}
        for i in range(1,len(str)):
            element = str[i-1] + str[i]
            if element.isalpha():
                if element in result:
                    result[element] += 1
                else:
                    result[element] = 1
        return result
    
    str1 = generate(str1.lower())
    str2 = generate(str2.lower())
    
    intersection = 0
    join = 0
    for key in str1:
        value = str1[key]
        if key in str2:
            intersection += min(value, str2[key])
            join += max(value, str2[key])
            del str2[key]
        else:
            join += value
        
    for key in str2:
        join += str2[key]
    
    
    return 65536 if join == 0 else int(intersection / join * 65536)
