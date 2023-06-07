//
//  무인도 여행.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/07.
//

import Foundation

func solution(_ maps:[String]) -> [Int] {

    var maps = maps.map{ Array($0) }
    let col = maps.count, row = maps[0].count
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: row), count: col)

    func findFood(_ i: Int, _ j: Int) -> Int{
        var food = Int(String(maps[i][j]))!
        for direction in [(-1,0),(1,0),(0,1),(0,-1)]{
            let x = i + direction.0, y = j + direction.1
            if x < col && x >= 0 && y >= 0 && y < row && maps[x][y] != "X" && !visit[x][y]{
                visit[x][y] = true
                food += findFood(x, y)
            }
        }
        return food
    }

    var ans = [Int]()
    for i in 0..<col{
        for j in 0..<row{
            if maps[i][j] != "X" && !visit[i][j]{
                visit[i][j] = true
                ans.append(findFood(i, j))
            }
        }
    }
    return ans.isEmpty ? [-1] : ans.sorted(by: <)
}
