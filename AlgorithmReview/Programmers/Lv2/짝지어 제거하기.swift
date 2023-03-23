//
//  짝지어 제거하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/23.
//

import Foundation

func reference(_ s:String) -> Int{
    var string = Array(s)
    var result = [Character]()
    for i in 0..<s.count{
        if(!result.isEmpty && string[i] == result.last!){
            result.removeLast()
        }else{
            result.append(string[i])
        }
    }
    return result.isEmpty ? 1 : 0
}
