//
//  가장 먼 노드.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/20.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {

    var tree = [[Int]](repeating: [], count: n+1)
    for i in edge{
        tree[i[0]].append(i[1])
        tree[i[1]].append(i[0])
    }

    var weights = [Int](repeating: Int.max, count: n+1)
    weights[1] = 0
    var queue = [1]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let nodeWeight = weights[node]
        for i in tree[node]{
            if weights[i] > nodeWeight + 1{
                weights[i] = nodeWeight + 1
                queue.append(i)
            }
        }
    }
    let ans = weights[1...].max()!
    return weights.filter{ $0 == ans }.count
}
