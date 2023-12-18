//
//  할인 행사.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/07.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {

    var map = [String:Int]()
    for (i, w) in want.enumerated() {
        map[w] = number[i]
    }
    
    //처음 10일에 대해 상품 구매
    for i in discount[0..<10] {
        if map[i] != nil {
            map[i]! -= 1
        }
    }
    
    var result = 0
    for i in 10..<discount.count+10 {
        //가입 가능 날짜인지 점검
        if map.allSatisfy({ $0.value <= 0 }) {
            result += 1
        }
        
        //날짜 슬라이딩 윈도우
        if i < discount.count && map[discount[i]] != nil {
            map[discount[i]]! -= 1
        }
        if map[discount[i-10]] != nil {
            map[discount[i-10]]! += 1
        }
    }
    
    return result
}
