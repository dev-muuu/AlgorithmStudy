//
//  전력망을 둘로 나누기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/08.
//

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {

    var nodes = [[Int]](repeating: [], count: n+1)
    for i in wires {
        nodes[i[0]].append(i[1])
        nodes[i[1]].append(i[0])
    }
    
    func bfs(_ num: Int, _ except: Int) -> Int{
        
        var count = 0
        var queue = [num]
        var visit = [Bool](repeating: false, count: n+1)
        visit[num] = true
        visit[except] = true
        
        while !queue.isEmpty {
            let pop = queue.removeFirst()
            for i in nodes[pop] {
                if !visit[i]  {
                    visit[i] = true
                    queue.append(i)
                    count += 1
                }
            }
        }
        
        return count
    }
    
    var answer = Int.max
    for w in wires {
        answer = min(answer, abs(bfs(w[0], w[1])-bfs(w[1], w[0])))
    }
    
    return answer
}
