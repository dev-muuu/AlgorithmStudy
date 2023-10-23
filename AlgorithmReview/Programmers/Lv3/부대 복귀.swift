//
//  부대 복귀.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/23.
//

import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    
    var map = [[Int]](repeating: [], count: n+1)
    for r in roads {
        map[r[0]].append(r[1])
        map[r[1]].append(r[0])
    }
    
    var distance = [Int](repeating: -1, count: n+1)
    distance[destination] = 0
    
    var q = [(destination, 0)]
    var visit = [Bool](repeating: false, count: n+1)
    visit[destination] = true
    while !q.isEmpty {
        let (node, count) = q.removeFirst()
        for i in map[node] {
            if !visit[i] {
                visit[i] = true
                distance[i] = count+1
                q.append((i, count+1))
            }
        }
    }
    
    var ans = [Int]()
    for i in sources {
        ans.append(distance[i])
    }
    
    return ans
}
