//
//  가장 가까운 같은 글자.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/22.
//

import Foundation

func solution1(_ s:String) -> [Int] {
    var mapping = [Character: Int]()
    var index = -1
    return s.map{
        index += 1
        guard let value = mapping[$0] else {
            mapping[$0] = index
            return -1
        }
        mapping[$0] = index
        return index - value
    }
}

func solution2(_ s:String) -> [Int] {
    var mapping = [Character: Int]()
    return s.enumerated().map{
        guard let value = mapping[$1] else {
            mapping[$1] = $0
            return -1
        }
        mapping[$1] = $0
        return $0 - value
    }
}

func solution3(_ s:String) -> [Int] {
    var mapping = [Character: Int]()
    return s.enumerated().map{
        let value = mapping[$1]
        mapping[$1] = $0
        return value == nil ? -1 : $0 - value!
    }
}

func reference(_ s: String) -> [Int] {
    return s.enumerated().map { (i, c) in i - (Array(s)[0..<i].lastIndex(of: c) ?? i + 1) }
}
