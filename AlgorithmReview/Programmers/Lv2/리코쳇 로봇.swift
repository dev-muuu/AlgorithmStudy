//
//  리코쳇 로봇.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/02.
//

import Foundation

func solution1(_ board:[String]) -> Int {
    
    let board = board.map{ Array($0) }
    let rows = board.count
    let cols = board[0].count

    var queue = [(Int, Int, Int)]()
    for (row, i) in board.enumerated() {
        for (col, j) in i.enumerated() {
            if j == "R" { queue.append((row, col, 0)); break }
        }
        if !queue.isEmpty { break }
    }
    
    func newCoordination(_ x: Int, _ y: Int, _ direction: (Int, Int)) -> (Int, Int){
        var x = x, y = y
        while x+direction.0 >= 0 && x+direction.0 < rows && y+direction.1 >= 0 && y+direction.1 < cols && board[x+direction.0][y+direction.1] != "D" {
            x += direction.0
            y += direction.1
        }
        return (x, y)
    }
    
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
    while !queue.isEmpty {
        
        let current = queue.removeFirst()
        let (x,y,c) = (current.0, current.1, current.2)
        
        if board[x][y] == "G" { return c }
        for direction in [(1,0), (-1,0), (0,1), (0,-1)] {
            let coord = newCoordination(x,y,direction)
            if visit[coord.0][coord.1] { continue }
            visit[coord.0][coord.1] = true
            queue.append((coord.0, coord.1, c+1))
        }
    }
    
    return -1
}


func solution2(_ board:[String]) -> Int {
    
    let board = board.map{ Array($0) }
    
    var start = (-1,-1)
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] == "R" {
                start = (i, j); break
            }
        }
        if start != (-1,-1) { break }
    }
    
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
    visit[start.0][start.1] = true
    var queue = [(start.0, start.1, 0)]
    var ans = -1

    func move(_ row: Int, _ col: Int, _ coord: (Int, Int),_ count: Int) {
        
        var row = row, col = col

        while row+coord.0 >= 0 && row+coord.0 < board.count && col+coord.1 >= 0 && col+coord.1 < board[0].count && board[row+coord.0][col+coord.1] != "D"{
            row += coord.0
            col += coord.1
        }
        
        if board[row][col] == "G" {
            ans = count
        } else if !visit[row][col] {
            visit[row][col] = true
            queue.append((row, col, count))
        }
    }
    
    while !queue.isEmpty {
        let (row, col, count) = queue.removeFirst()
        for coord in [(1,0), (0,1), (-1,0), (0,-1)] {
            move(row, col, coord, count+1)
            if ans != -1 { break }
        }
        if ans != -1 { break }
    }
    
    return ans
}
