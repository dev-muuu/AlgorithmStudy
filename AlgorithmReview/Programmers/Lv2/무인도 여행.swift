//
//  무인도 여행.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/07.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {
    
    let maps = maps.map{ Array($0) }
    let size = (maps.count, maps[0].count)

    var answer = [Int]()
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: size.1), count: size.0)
    var sum = 0
    
    func move(_ row: Int, _ col:Int) {
        
        func isValid(_ i: Int, _ j: Int) -> Bool {
            i >= 0 && i < size.0 && j >= 0 && j < size.1
        }
        
        sum += Int(String(maps[row][col]))!
        
        for c in [(1,0), (0,1), (-1, 0), (0,-1)] {
            let (i, j) = (row+c.0, col+c.1)
            if isValid(i, j) && maps[i][j] != "X" && !visit[i][j] {
                visit[i][j] = true
                move(i, j)
            }
        }
    }

    for i in 0..<size.0 {
        for j in 0..<size.1 {
            if !visit[i][j] && maps[i][j] != "X" {
                sum = 0
                visit[i][j] = true
                move(i, j)
                answer.append(sum)
            }
        }
    }
    
    return answer.isEmpty ? [-1] : answer.sorted(by:<)
}
