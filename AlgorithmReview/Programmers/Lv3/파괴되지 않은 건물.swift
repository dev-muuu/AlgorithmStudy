//
//  파괴되지 않은 건물.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/24.
//

import Foundation

func timeout(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    
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

func reference(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    
    let (row, col) = (board.count, board[0].count)
    var temp = [[Int]](repeating: [Int](repeating: 0, count: col+1), count: row+1)
    
    for s in skill {
        let (type, r1, c1, r2, c2) = (s[0], s[1], s[2], s[3], s[4])
        let degree = type == 2 ? s[5] : -s[5]
        temp[r1][c1] += degree
        temp[r1][c2+1] += -degree
        temp[r2+1][c1] += -degree
        temp[r2+1][c2+1] += degree
    }
 
    // 행 기준 누적합
    for i in 0..<row{
        for j in 0..<col{
            temp[i][j+1] += temp[i][j]
        }
    }
 
    // 열 기준 누적합
    for i in 0..<row{
        for j in 0..<col{
            temp[i+1][j] += temp[i][j]
        }
    }
 
    var board = board
    var ans = 0
    for i in 0..<row{
        for j in 0..<col{
            board[i][j] += temp[i][j]
            if board[i][j] > 0{
                ans += 1
            }
        }
    }
    return ans
}
