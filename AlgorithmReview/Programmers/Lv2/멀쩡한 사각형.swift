//
//  멀쩡한 사각형.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/20.
//

import Foundation

func solution(_ w:Int, _ h:Int) -> Int{
    var minW = w, minH = h
    var delete = 1
    for i in stride(from: min(w, h), to: 1, by: -1) {
        if w % i == 0 && h % i == 0 {
            minW = w / i
            minH = h / i
            delete = i
            break
        }
    }
    return w * h - (minW + minH - 1) * delete
}
