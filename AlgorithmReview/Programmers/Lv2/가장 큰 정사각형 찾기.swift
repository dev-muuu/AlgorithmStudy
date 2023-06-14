//
//  가장 큰 정사각형 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/14.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    let m = board[0].count
    let n = board.count
    var length = board
    
    var ans = 0
    if board[0].contains(1) {
        ans = 1
    }
    if ans == 0 {
        for i in 0..<n{
            if board[i][0] == 1 {
                ans = 1; break
            }
        }
    }

    for j in stride(from: 1, to: m, by: +1){
        for i in stride(from: 1, to: n, by: +1){
            if board[i][j] == 0{
                continue
            }
            var target = min(length[i][j-1], length[i-1][j], length[i-1][j-1])
            let len = target + 1
            length[i][j] = len
            ans = max(len, ans)
        }
    }
    return ans * ans
}
