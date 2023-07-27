//
//  미로 탈출.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/27.
//

import Foundation

//DFS 풀이 > 시간 초과
func solution(_ maps:[String]) -> Int {
    
    let maps = maps.map{ Array($0) }
    var leverCount = Int.max
    var ans = Int.max
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: maps[0].count), count: maps.count)
    var lever: (Int, Int)!
    
    func isCoordinateValid(_ x: Int, _ y: Int) -> Bool{
        x >= 0 && x < maps.count && y >= 0 && y < maps[0].count
    }
    
    func moveForExist(_ x: Int, _ y: Int, _ count: Int){
        
        if maps[x][y] == "E"{
            ans = min(ans, leverCount + count); return
        } else if count + leverCount >= ans { return }
        
        for coord in [(-1,0), (0,-1), (0,1), (1,0)] {
            let newX = x+coord.0, newY = y+coord.1
            if isCoordinateValid(newX, newY) && maps[newX][newY] != "X" && !visit[newX][newY]{
                visit[newX][newY] = true
                moveForExist(newX, newY, count + 1)
                visit[newX][newY] = false
            }
        }
    }
    
    func moveForLever(_ x: Int, _ y: Int, _ count: Int){
        if maps[x][y] == "L" {
            lever = (x, y)
            leverCount = min(leverCount, count)
            return
        } else if count >= ans { return }
        
        for coord in [(-1,0), (0,-1), (0,1), (1,0)] {
            let newX = x+coord.0, newY = y+coord.1
            if isCoordinateValid(newX, newY) && maps[newX][newY] != "X" && !visit[newX][newY]{
                visit[newX][newY] = true
                moveForLever(newX, newY, count + 1)
                visit[newX][newY] = false
            }
        }
    }

    var start: (Int, Int)!
    for row in maps.enumerated() {
        for col in row.element.enumerated() {
            if col.element == "S" { start = (row.offset, col.offset); break }
        }
        if start != nil { break }
    }
    
    visit[start.0][start.1] = true
    moveForLever(start.0, start.1, 0)
    visit[start.0][start.1] = false
    
    if lever == nil { return -1 }
    visit[lever.0][lever.1] = true
    moveForExist(lever.0, lever.1, 0)
    
    return ans == Int.max ? -1 : ans
}
