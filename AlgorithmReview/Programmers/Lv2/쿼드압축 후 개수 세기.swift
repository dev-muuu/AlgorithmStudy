//
//  쿼드압축 후 개수 세기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/31.
//

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    
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
