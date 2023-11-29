//
//  뉴스 클러스트링.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/06.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    let str1 = makeSet(str1), str2 = makeSet(str2)

    if str1.count == 0 && str2.count == 0 {
        return 65536
    }

    var intersection = 0
    var union = 0
    for i in str1.keys {
        let value1 = str1[i]!
        if let value2 = str2[i] {
            intersection += min(value1, value2)
            union += max(value1, value2)
        }
        else {
            union += value1
        }
    }
    for i in str2.keys {
        if str1[i] == nil {
            union += str2[i]!
        }
    }
    return Int(Float(intersection) / Float(union) * 65536)
}

func makeSet(_ str: String) -> [String: Int] {
    let str = Array(str.lowercased())
    var result = [String:Int]()
    for i in 0..<str.count-1 {
        if str[i].isLetter && str[i+1].isLetter{
            let key = "\(str[i])\(str[i+1])"
            if result[key] == nil {
                result[key] = 0
            }
            result[key]! += 1
        }
    }
    return result
}
