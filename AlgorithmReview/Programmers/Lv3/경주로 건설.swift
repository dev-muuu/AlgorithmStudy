//
//  경주로 건설.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/11.
//

import Foundation

func timeout(_ board:[[Int]]) -> Int {
    
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: board.count), count: board.count)
    var ans = Int.max
    
    func valid(_ i: Int, _ j: Int) -> Bool {
        i < board.count && i >= 0 && j < board.count && j >= 0 && board[i][j] == 0 && !visit[i][j]
    }
    
    func move(_ i: Int, _ j: Int, _ d: (Int, Int), _ s: Int, _ c: Int) {
        
        if i == board.count-1 && j == board.count-1 {
            ans = min(ans, 100*s + 500*c); return
        } else if 100*s + 500*c >= ans {
            return
        }
        
        for coord in [(1,0),(-1,0),(0,1),(0,-1)] {
            let row = coord.0 + i, col = coord.1 + j
            if valid(row, col){
                visit[row][col] = true
                let corner = d == coord ? c : c+1
                move(row,col,coord,s+1,corner)
                visit[row][col] = false
            }
        }
    }
    
    visit[0][0] = true
    move(0,0,(0,0),0,-1)
    
    return ans
}
