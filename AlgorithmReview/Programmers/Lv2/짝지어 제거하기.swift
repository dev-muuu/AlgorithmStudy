//
//  짝지어 제거하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/23.
//

import Foundation

func answer(_ s:String) -> Int{
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

func timeout(_ s:String) -> Int{
    var s = Array(s)
    var index = s.count-1
    while index > 0 {
        if s[index] == s[index-1] {
            if index-2 < 0 {
                return s.count > 2 ? 0 : 1
            }
            s.remove(at: index-1)
            s.remove(at: index-1)
            index = index-1 == s.count ? index-2 : index-1
        } else {
            index -= 1
        }
    }
    return s.isEmpty ? 1 : 0
}
