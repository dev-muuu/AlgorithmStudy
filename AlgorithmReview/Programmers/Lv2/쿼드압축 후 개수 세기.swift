//
//  쿼드압축 후 개수 세기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/31.
//

import Foundation

func solution1(_ arr:[[Int]]) -> [Int] {
    
    func dfs(_ top: Int, _ left: Int, _ length: Int) -> [Int]{
        
        if length == 1 {
            return arr[top][left] == 1 ? [0,1] : [1,0]
        }
        
        var temp = [0,0]
        for i in [(0,0), (length/2, 0), (0, length/2), (length/2, length/2)] {
            let value = dfs(top + i.0, left + i.1, length/2)
            temp[0] += value[0]
            temp[1] += value[1]
        }
        
        if temp[0] == 0{
            temp = [0,1]
        } else if temp[1] == 0{
            temp = [1,0]
        }
        return temp
    }

    return dfs(0,0,arr.count)
}

func solution2(_ arr:[[Int]]) -> [Int] {
    
    var answer = [0,0]
    
    func allSatisfy(_ row: Int, _ col: Int, _ length: Int, _ value: Int) -> Bool {
        for i in row..<row+length {
            for j in col..<col+length {
                if arr[i][j] != value {
                    return false
                }
            }
        }
        return true
    }
    
    func dfs(_ row: Int, _ col: Int, _ length: Int) {
        if allSatisfy(row,col,length,1) {
            answer[1] += 1
        }
        else if allSatisfy(row, col, length, 0) {
            answer[0] += 1
        }
        else {
            for (i, j) in [(row, col), (row+length/2, col), (row, col+length/2), (row+length/2, col+length/2)] {
                dfs(i, j, length/2)
            }
        }
    }
    
    dfs(0,0,arr.count)
    
    return answer
}
