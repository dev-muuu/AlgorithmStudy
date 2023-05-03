//
//  기능개발.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/03.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {

    var date = [Int]()
    for i in 0..<progresses.count{
        let remain = 100 - progresses[i]
        var necessary = remain / speeds[i]
        if remain % speeds[i] != 0{
            necessary += 1
        }
        date.append(necessary)
    }
    
    var ans = [Int]()
    var distribution = (standard: date.first!, count: 0)
    for i in date{
        if i <= distribution.standard{
            distribution.count += 1
        } else {
            ans.append(distribution.count)
            distribution = (i, 1)
        }
    }
    ans.append(distribution.count)
    return ans
}
