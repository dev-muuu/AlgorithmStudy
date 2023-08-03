//
//  리코쳇 로봇.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/02.
//

import Foundation

func solution(_ board:[String]) -> Int {
    
    let board = board.map{ Array($0) }
    let rows = board.count
    let cols = board[0].count

    var start: (Int, Int)!
    for (row, i) in board.enumerated() {
        for (col, j) in i.enumerated() {
            if j == "R" { start = (row, col); break}
        }
        if start != nil { break }
    }
    
    func move(_ x: Int, _ y: Int, _ count: Int){

        if board[x][y] == "G" {
            ans = min(ans, count); return
        } else if count >= ans {
            return
        }
        
        for direction in [(1,0), (-1,0), (0,1), (0,-1)] {
            let coord = newCoordination(x,y,direction)
            if visit[coord.0][coord.1] { continue }
            visit[coord.0][coord.1] = true
            move(coord.0, coord.1, count+1)
            visit[coord.0][coord.1] = false
        }
        
    }
    
    func newCoordination(_ x: Int, _ y: Int, _ direction: (Int, Int)) -> (Int, Int){
        var x = x, y = y
        while x+direction.0 >= 0 && x+direction.0 < rows && y+direction.1 >= 0 && y+direction.1 < cols && board[x+direction.0][y+direction.1] != "D" {
            x += direction.0
            y += direction.1
        }
        return (x, y)
    }
    
    var ans = Int.max
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
    move(start.0, start.1, 0)
    
    return ans == Int.max ? -1 : ans
}
