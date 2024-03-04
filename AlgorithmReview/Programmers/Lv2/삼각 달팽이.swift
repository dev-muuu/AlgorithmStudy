//
//  삼각 달팽이.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/04.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    
    var result = [[Int]]()
    for i in 1...n {
        result.append([Int](repeating: 0, count: i))
    }
    
    var num = 1
    let size = (1...n).reduce(0){ $0 + $1 }
    
    var row = (0, n-1)
    var col = 0
    
    while num <= size {
        
        //왼: row +1씩, col 고정
        for i in stride(from: row.0, to: row.1+1, by: +1) {
            if num > size {
                break
            }
            result[i][col] = num
            num += 1
        }
        
        //아래: col +1씩, row 고정
        for i in stride(from: col+1, to: result[row.1].count-col, by: +1){
            if num > size {
                break
            }
            result[row.1][i] = num
            num += 1
        }
        
        //오른: row -1씩, col -1씩
        for i in stride(from: row.1-1, to: row.0, by: -1){
            if num > size {
                break
            }
            let targetC = result[i].count-1 - col
            result[i][targetC] = num
            num += 1
        }
        
        row.0 += 2
        row.1 -= 1
        col += 1
    }
    
    return result.flatMap{ $0 }
}
