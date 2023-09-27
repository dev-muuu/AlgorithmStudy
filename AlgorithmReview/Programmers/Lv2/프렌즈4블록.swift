//
//  프렌즈4블록.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/22.
//

import Foundation

func solution1(_ m:Int, _ n:Int, _ board:[String]) -> Int {

    var board = board.map{ Array($0) }
    
    struct Coord: Hashable{
        let x: Int
        let y: Int
    }
    
    func clearBingo(_ row: Int, _ col: Int) -> Set<Coord>{
        
        let target = board[row][col]
        var temp = Set<Coord>()
    
        var leftTopRow = 0
        var direction = [(m-1, col)]
        for i in stride(from: m-1, to: row-1, by: -1){
            if !ans.contains(Coord(x: i,y:col)) {
                leftTopRow += 1
                if i != row {
                    direction[0] = (i, col)
                }
            }
        }
        
        var rightTopRow = 0
        for i in stride(from: m-1, to: -1, by: -1){
            if !ans.contains(Coord(x: i,y:col+1)) {
                rightTopRow += 1
                if rightTopRow == leftTopRow - 1{
                    direction.append((i, col+1))
                } else if rightTopRow == leftTopRow{
                    direction.append((i, col+1)); break
                }
            }
        }
        
        if direction.count < 3 { return Set() }

        if direction.allSatisfy({ board[$0.0][$0.1] == target }) {
            for i in direction {
                temp.insert(Coord(x: i.0, y: i.1))
            }
            temp.insert(Coord(x: row, y: col))
        }
        return temp
    }
    
    func find() -> Set<Coord>{
        var row = 0, col = 0
        var coord = Set<Coord>()
        while row < m-1 {
            let temp = clearBingo(row, col)
            for i in temp{
                coord.insert(i)
            }
            col = col + 1
            if col == n-1 {
                col = 0; row += 1
            }
        }
        return coord
    }
    
    var ans = Set<Coord>()
    while true{
        let temp = find()
        if temp.count == 0 {
            break
        }
        for i in temp{
            ans.insert(i)
        }
    }
    
    return ans.count
}

func solution2(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    let originalBoard = board.map{ Array($0) }
    var board = [[Character]](repeating: [], count: n)
    for i in 0..<n {
        for j in stride(from : m-1 , to: -1, by: -1) {
            board[i].append(originalBoard[j][i])
        }
    }

    var ans = 0
    var willRemove = Set<[Int]>()
    
    func check(_ row: Int, _ col: Int) {
        let coord = [(row, col), (row+1, col), (row, col+1), (row+1, col+1)]
        if !coord.allSatisfy({ board[$0.0].count > $0.1 }) {
            return
        }
        //각 좌표가 유효한 범위인지 & 모두 동일한지 점검
        let value = board[coord[0].0][coord[0].1]
        if coord.allSatisfy({ board[$0.0][$0.1] == value }) {
            coord.forEach {
              willRemove.insert([$0.0, $0.1])
            }
        }
    }
    
    repeat {
        willRemove = Set<[Int]>()
        for i in 0..<n-1{
            for j in 0..<m-1 {
                check(i, j)
            }
        }
        
        let remove = willRemove.sorted(by: { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0]})
        for r in remove {
            board[r[0]].remove(at: r[1])
        }
        ans += remove.count
    } while willRemove.count > 0
    
    return ans
}
