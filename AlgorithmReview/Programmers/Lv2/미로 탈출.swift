//
//  미로 탈출.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/27.
//

import Foundation

func timeout(_ maps:[String]) -> Int {
    
    let maps = maps.map{ Array($0) }
    
    var start = (-1,-1), end = (-1, -1), lever = (-1,-1)
    for i in 0..<maps.count{
        for j in 0..<maps[0].count {
            if maps[i][j] == "S" {
                start = (i, j)
            } else if maps[i][j] == "E" {
                end = (i, j)
            } else if maps[i][j] == "L" {
                lever = (i, j)
            }
        }
    }
    
    var ans = (10001, 10001)
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: maps[0].count), count: maps.count)
    
    func moveForLever(_ row: Int, _ col: Int, _ count: Int) {
        if row == lever.0 && col == lever.1 {
            ans.0 = min(ans.0, count)
        }
        
        for coord in [(1,0), (-1,0), (0,1), (0,-1)] {
            let newRow = row+coord.0
            let newCol = col+coord.1
            if canMove(newRow, newCol) && count+1 < ans.0{
                visit[newRow][newCol] = true
                moveForLever(newRow, newCol, count+1)
                visit[newRow][newCol] = false
            }
        }
    }
    
    func moveForEnd(_ row: Int, _ col: Int, _ count: Int) {
        if row == end.0 && col == end.1 {
            ans.1 = min(ans.1, count)
        }
        for coord in [(1,0), (-1,0), (0,1), (0,-1)] {
            let newRow = row+coord.0, newCol = col+coord.1
            if canMove(newRow, newCol) && count+1 < ans.1{
                visit[newRow][newCol] = true
                moveForEnd(newRow, newCol, count+1)
                visit[newRow][newCol] = false
            }
        }
    }
    
    func canMove(_ row: Int, _ col: Int) -> Bool {
        row < maps.count && row >= 0 && col < maps[0].count && col >= 0 && maps[row][col] != "X" && !visit[row][col]
    }
    
    visit[start.0][start.1] = true
    moveForLever(start.0, start.1, 0)
    if ans.0 == 10001 {
        return -1
    }
    
    for i in 0..<maps.count{
        for j in 0..<maps[0].count {
            visit[i][j] = false
        }
    }
    
    visit[lever.0][lever.1] = true
    moveForEnd(lever.0, lever.1, 0)

    return ans.1 == 10001 ? -1 : ans.0 + ans.1
}

func reference(_ maps:[String]) -> Int {
    
    let maps = maps.map{ Array($0) }
    
    func isCoordinateValid(_ x: Int, _ y: Int) -> Bool{
        x >= 0 && x < maps.count && y >= 0 && y < maps[0].count
    }
    
    func move(_ start: Character, _ end: Character) -> Int{
        
        var queue = [(Int, Int, Int)]()
        var visit = [[Bool]](repeating: [Bool](repeating: false, count: maps[0].count), count: maps.count)
        
        for row in maps.enumerated() {
            for col in row.element.enumerated() {
                if col.element == start {
                    queue.append((row.offset, col.offset, 1))
                    visit[row.offset][col.offset] = true
                    break
                }
                
            }
            if !queue.isEmpty { break }
        }
        
        while !queue.isEmpty{
            let current = queue.removeFirst()
            for coord in [(-1,0), (0,-1), (0,1), (1,0)] {
                let newX = current.0+coord.0, newY = current.1+coord.1
                 if isCoordinateValid(newX, newY) && maps[newX][newY] != "X" && !visit[newX][newY]{
                     if maps[newX][newY] == end {
                         return current.2
                     }
                     visit[newX][newY] = true
                     queue.append((newX, newY, current.2 + 1))
                 }
            }
        }
        
        return -1
    }
    
    let first = move("S", "L")
    if first == -1 { return -1 }
    let second = move("L", "E")
    return second == -1 ? -1 : first + second
}

func solution(_ maps:[String]) -> Int {
    
    let maps = maps.map{ Array($0) }
    
    var start = (-1,-1), end = (-1, -1), lever = (-1,-1)
    for i in 0..<maps.count{
        for j in 0..<maps[0].count {
            if maps[i][j] == "S" {
                start = (i, j)
            }
            else if maps[i][j] == "E" {
                end = (i, j)
            }
            else if maps[i][j] == "L" {
                lever = (i, j)
            }
        }
    }
    
    var ans = (-1, -1)
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: maps[0].count), count: maps.count)
    
    func canMove(_ row: Int, _ col: Int) -> Bool {
        row < maps.count && row >= 0 && col < maps[0].count && col >= 0 && maps[row][col] != "X" && !visit[row][col]
    }
    
    var leverQ = [(start.0, start.1, 0)]
    while !leverQ.isEmpty {
        let (row, col, count) = leverQ.removeFirst()
        
        for coord in [(1,0), (-1,0), (0,1), (0,-1)] {
            let newRow = row+coord.0
            let newCol = col+coord.1
            
            if newRow == lever.0 && newCol == lever.1 {
                ans.0 = count+1; break
            }
            
            if canMove(newRow, newCol) {
                visit[newRow][newCol] = true
                leverQ.append((newRow, newCol, count+1))
            }
        }
        if ans.0 != -1 {
            break
        }
    }
    
    if ans.0 == -1 {
        return -1
    }
    
    for i in 0..<maps.count{
        for j in 0..<maps[0].count {
            visit[i][j] = false
        }
    }
    
    var endQ = [(lever.0, lever.1, 0)]
    while !endQ.isEmpty {
        let (row, col, count) = endQ.removeFirst()
        
        for coord in [(1,0), (-1,0), (0,1), (0,-1)] {
            let newRow = row+coord.0
            let newCol = col+coord.1
            
            if newRow == end.0 && newCol == end.1 {
                ans.1 = count+1; break
            }
            
            if canMove(newRow, newCol) {
                visit[newRow][newCol] = true
                endQ.append((newRow, newCol, count+1))
            }
        }
        if ans.1 != -1 {
            break
        }
    }

    return ans.1 == -1 ? -1 : ans.0 + ans.1
}
