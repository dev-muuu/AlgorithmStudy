//
//  전력망을 둘로 나누기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/08.
//

import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {

    var mapping = [[Int]](repeating: [], count: n+1)
    for i in wires{
        mapping[i[0]].append(i[1])
        mapping[i[1]].append(i[0])
    }
    
    func counting(_ node: Int, _ except: Int) -> Int{
        var visit = [Bool](repeating: false, count: n+1)
        visit[node] = true
        visit[except] = true
        
        var count = 1
        var queue = [node]
        while !queue.isEmpty{
            let pop = queue.removeFirst()
            for i in mapping[pop]{
                if !visit[i]{
                    visit[i] = true
                    count += 1
                    queue.append(i)
                }
            }
        }
        return count
    }
    
    var ans = Int.max
    for i in wires{
        ans = min((abs(counting(i[0], i[1]) - counting(i[1], i[0]))), ans)
    }
    
    return ans
}
