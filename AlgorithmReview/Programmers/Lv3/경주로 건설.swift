//
//  경주로 건설.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/11.
//

import Foundation

func reference(_ board:[[Int]]) -> Int {
    
    let size = board.count
    var board = board
    var dp = [[Int]](repeating: [Int](repeating: size*size*500, count: board.count), count: board.count)
    var ans = Int.max
    
    func move(_ i: Int, _ j: Int, _ d: (Int, Int), _ cost: Int) {
        
        if i == size-1 && j == size-1 {
            ans = min(ans, cost)
            return
        } else if dp[i][j] < cost {
            return
        }
        
        dp[i][j] = cost

        for coord in [(0,1),(1,0),(0,-1),(-1,0)] {
            let row = coord.0 + i, col = coord.1 + j
            if row < board.count && row >= 0 && col < board.count && col >= 0 && board[row][col] == 0 {
                board[row][col] = -1
                if d == coord {
                    move(row,col,coord,cost+100)
                } else {
                    move(row,col,coord,cost+600)
                }
                board[row][col] = 0
            }
        }
    }
    
    board[0][0] = -1
    move(0,0,(0,0),0)
    
    return ans - 500
}
