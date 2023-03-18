//
//  바탕화면 정리.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {

    var result = [100, 100, -1, -1]
    for (row, i) in wallpaper.enumerated(){
        for (col, j) in i.enumerated(){
            if(j == "#"){
                result[0] = min(result[0], row)
                result[1] = min(result[1], col)
                result[2] = max(result[2], row+1)
                result[3] = max(result[3], col+1)
            }
        }
    }

    return result
}
