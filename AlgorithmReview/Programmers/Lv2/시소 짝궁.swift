//
//  시소 짝궁.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/24.
//

import Foundation

func solution(_ weights:[Int]) -> Int {

    var count = [Int:Int]()
    var numsCount = [Int: Int]()
    for i in weights {
        numsCount[i] = (numsCount[i] ?? 0) + 1
        for j in [2,3,4]{
            count[i*j] = (count[i*j] ?? 0) + 1
        }
    }
    
    func combination(_ n: Int) -> Int{
        return n * (n-1) / 2
    }
    
    var ans = 0
    for i in count.filter({ $0.value > 1 }) {
        ans += combination(i.value)
    }
    for i in numsCount.filter({ $0.value > 1 }){
        ans -= combination(i.value) * 2
    }

    return ans
}
