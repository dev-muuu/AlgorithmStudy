//
//  삼각 달팽이.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/04.
//

import Foundation

func reference(_ n:Int) -> [Int] {
    var ans = [Int]()
    var array = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var (x, y) = (-1, 0)
    var num = 1

    for i in 0..<n{
        for j in i..<n{
            if i % 3 == 0{
                x += 1
            } else if i % 3 == 1{
                y += 1
            } else if i % 3 == 2 {
                x -= 1
                y -= 1
            }
            array[x][y] = num
            num += 1
        }
    }

    for i in array{
        for j in i{
            if j != 0 {
                ans.append(j)
            }
        }
    }
    return ans
}

func solution(_ n:Int) -> [Int] {
    
    let endNumber = (1...n).reduce(0){ $0+$1 }
    for i in 1...n{
        ans.append([Int](repeating: 0, count:i))
    }
    
    var number = 1
    var row = (0, n-1), col = 0
    var ans = [[Int]]()
    while number <= endNumber{
        //왼쪽
        for i in stride(from: row.0, to: row.1+1, by:+1){
            if number > endNumber { break }
            ans[i][col] = number
            number += 1
        }
        //하단
        for i in stride(from: col+1, to: ans[row.1].count-col, by: +1){
            if number > endNumber { break }
            ans[row.1][i] = number
            number += 1
        }
        //오른쪽
        for i in stride(from: row.1-1, to: row.0, by: -1){
            if number > endNumber { break }
            let targetCol = (ans[i].count-1) - col
            ans[i][targetCol] = number
            number += 1
        }
        
        row.0 += 2
        row.1 -= 1
        col += 1
    }
    return ans.flatMap{ $0 }
}
