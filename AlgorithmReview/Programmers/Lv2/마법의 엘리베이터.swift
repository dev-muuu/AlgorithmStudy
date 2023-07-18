//
//  마법의 엘리베이터.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/18.
//

import Foundation

func solution(_ storey:Int) -> Int {
    var storey = String(storey).map{ Int(String($0))! }
    var ans = 0
    for i in stride(from: storey.count-1, to: -1, by: -1){
        if storey[i] > 5 {
            ans += 10 - storey[i]
            if i == 0 {
                ans += 1
            } else {
                storey[i-1] += 1
            }
        } else if storey[i] == 5 && i > 0 && storey[i-1] >= 5 {
            storey[i-1] += 1
            ans += 5
        } else {
            ans += storey[i]
        }
    }
    return ans
}
