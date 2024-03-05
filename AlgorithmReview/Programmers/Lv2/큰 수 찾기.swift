//
//  큰 수 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/03.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {

    var result = [String]()
    let number = Array(number).map{ String($0) }

    for i in 0..<number.count {
        while !result.isEmpty && result.count+number.count-i > number.count-k && Int(result.last!)! < Int(number[i])! {
            result.removeLast()
        }
        result.append(number[i])
    }
    
    if result.count > number.count-k {
        result.removeLast()
    }
    
    return result.joined()
}
