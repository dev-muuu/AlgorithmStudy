//
//  가장 가까운 같은 글자.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/22.
//

import Foundation

func solution(_ s:String) -> [Int] {
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
