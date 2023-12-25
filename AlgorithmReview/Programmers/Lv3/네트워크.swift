//
//  네트워크.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/05.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {

    var visit = [Bool](repeating: false, count: n)
    
    func network(_ k: Int) {
        for i in 0..<n{
            if computers[k][i] == 1 && !visit[i] {
                visit[i] = true
                network(i)
            }
        }
    }
    
    var result = 0
    for i in 0..<n{
        if !visit[i] {
            visit[i] = true
            result += 1
            network(i)
        }
    }
    
    return result
}
