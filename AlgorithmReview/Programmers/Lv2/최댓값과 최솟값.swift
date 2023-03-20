//
//  최댓값과 최솟값.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation

func solution(_ s:String) -> String {
    let array = s.split(separator: " ").map{ Int($0)! }
    return "\(array.min()!) \(array.max()!)"
}
