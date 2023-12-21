def solution(numbers, target):

    queue = [0]
    for i in numbers:
        update = []
        for q in queue:
            update.append(q + i)
            update.append(q - i)
        queue = update

    return len(list(filter(lambda x: x == target, queue)))
