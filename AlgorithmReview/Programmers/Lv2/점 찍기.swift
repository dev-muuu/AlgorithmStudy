//
//  점 찍기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/09.
//

import Foundation

func reference(_ k:Int, _ d:Int) -> Int64 {
    var ans = 0
    for i in stride(from: 0, to: d+1, by: +k){
        ans += Int(sqrt(Double(d*d - i*i))) / k + 1
    }
    return Int64(ans)
}

func solution(_ k:Int, _ d:Int) -> Int {
    var ans = 0
    for x in stride(from: 0, to: d+1, by: +k){
        var start = 0, end = d
        var temp = 0
        while start <= end {
            let mid = (start + end)/2
            if x*x + mid*mid <= d*d {
                temp = max(temp, mid)
                start = mid+1
            } else {
                end = mid-1
            }
        }
        ans += (temp/k)+1
    }
    return ans
}
