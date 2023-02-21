//
//  푸드 파이트 대회.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/21.
//

import Foundation

func solution(_ food:[Int]) -> String {
    var l = ""
    var r = ""
    (1..<food.count).map{
        l = l + String.init(repeating: String($0), count: food[$0] / 2)
        r = String.init(repeating: String($0), count: food[$0] / 2) + r
    }
    return l + "0" + r
}
