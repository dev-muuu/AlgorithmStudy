//
//  우박수열 정적분.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/07.
//

import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    
    var coord = [k], k = k
    while k != 1 {
        if k % 2 == 0 {
            k /= 2
        } else {
            k = k*3 + 1
        }
        coord.append(k)
    }

    var values = [Double]()
    for x in 0..<coord.count-1{
        var sum = Double(coord[x] + coord[x+1])
        values.append(sum / 2)
    }
    
    var ans = [Double]()
    for range in ranges {
        let start = range[0]
        var end = coord.count-1
        if range[1] != 0 { end += range[1] }
        let temp: Double
        if start > end {
            temp = -1
        } else if start == end {
            temp = 0
        } else {
            temp = values[start..<end].reduce(0,+)
        }
        ans.append(temp)
    }
    return ans
}
