//
//  네트워크.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/05.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    func bfs(node: Int){
        var queue = [node]
        while !queue.isEmpty {
            let pop = queue.removeFirst()
            if visit[pop] {
                continue
            }
            visit[pop] = true
            for j in stride(from: 0, to: n, by: +1){ //절반만 고려하게 될 경우 논리 오류
                if computers[pop][j] == 1{
                    queue.append(j)
                }
            }
        }
    }
    
    var visit = [Bool](repeating: false, count: n)
    var network = 0
    for i in 0..<n{
        if !visit[i] {
            network += 1
            bfs(node: i)
        }
    }
    
    return network
}
