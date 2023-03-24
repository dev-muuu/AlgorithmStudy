//
//  예상 대진표.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/24.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int{
    var info = (1, a-1, b-1) //라운드, a 인덱스, b 인덱스
    while(info.1 != info.2){
        info = (info.0 + 1, info.1 / 2, info.2 / 2)
    }
    return info.0 - 1
}
