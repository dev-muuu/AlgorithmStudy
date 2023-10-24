//
//  파괴되지 않은 건물.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/24.
//

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    
    let (row, col) = (board.count, board[0].count)
    
    var board = board
    for s in skill {
        let degree = s[0] == 1 ? -s[5] : s[5]
        for i in s[1]...s[3]{
            for j in s[2]...s[4]{
                board[i][j] += degree
            }
        }
    }
    
    var ans = 0
    for i in 0..<row {
        for j in 0..<col {
            if board[i][j] > 0 {
                ans += 1
            }
        }
    }
    return ans
}
