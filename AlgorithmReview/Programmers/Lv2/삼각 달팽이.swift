//
//  삼각 달팽이.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/04.
//

import Foundation

func solution(_ n:Int) -> [Int] {

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
