//
//  큰 수 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/03.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let number = Array(number).map{ String($0) }
    var ans = [String]()
    for (i,c) in number.enumerated() {
        while !ans.isEmpty && ans.last! < c && ans.count + number.count-i > number.count-k{
            ans.removeLast()
        }
        ans.append(c)
    }
    if ans.count > number.count-k {
        ans.removeLast()
    }
    return ans.joined()
}
