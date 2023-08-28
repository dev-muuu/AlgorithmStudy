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
