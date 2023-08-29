//
//  디스크 컨트롤러.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/28.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {

    let jobs = jobs.sorted(by: { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]})

    var sum = jobs[0][1]
    var time = jobs[0][0] + jobs[0][1]
    var index = 1
    var heap = Heap<[Int]>(elements: [], sortFunction: { $0[1] < $1[1] })

    while index < jobs.count || !heap.isEmpty {

        while index < jobs.count && jobs[index][0] <= time {
            heap.insert(node: jobs[index])
            index += 1
        }

        if index < jobs.count && heap.isEmpty {
            time = jobs[index][0] + jobs[index][1]
            sum += jobs[index][1]
            index += 1
        } else {
            let pop = heap.remove()!
            sum += time - pop[0] + pop[1]
            time += pop[1]
        }
    }
    return sum / jobs.count
}

func python(){
    
    import queue

    class Task:
        def __init__(self, start, during):
            self.start = start
            self.during = during

        def __lt__(self,other):
            return self.start < other.start if self.during == other.during else self.during < other.during
        
    def solution(jobs):
        
        def custom_sort(l, r):
            return l[1] < r[1] if l[0] == r[0] else l[0] < r[0]
        
        jobs.sort(key = lambda x:(x[0], x[1]))
        
        sum = jobs[0][1]
        time = jobs[0][0] + jobs[0][1]
        idx = 1

        q = queue.PriorityQueue()
        while idx < len(jobs) or not q.empty() :
            
            while idx < len(jobs) and jobs[idx][0] <= time:
                q.put(Task(jobs[idx][0], jobs[idx][1]))
                idx += 1
            
            if q.empty() and idx < len(jobs):
                time = jobs[idx][0] + jobs[idx][1]
                sum += jobs[idx][1]
                idx += 1
            else:
                pop = q.get()
                sum += pop.during + time - pop.start
                time += pop.during
        
        return int(sum / len(jobs))
}
