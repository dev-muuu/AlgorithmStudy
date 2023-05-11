//
//  압축.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation

func solution(_ msg:String) -> [Int] {

    var mapIndex = [String:Int]()
    for i in 0...25{
        let ch = Character(UnicodeScalar(65 + i)!)
        mapIndex[String(ch)] = i + 1
    }

    let msg = Array(msg).map{ String($0) }
    var ans = [Int]()
    var index = 0
    while index < msg.count {
        var i = index + 1
        while i < msg.count {
            let check = msg[index...i].joined()
            if mapIndex[check] == nil { break }
            i += 1
        }

        let w = msg[index..<i].joined()
        ans.append(mapIndex[w]!)

        if i != msg.count {
            let c = msg[i]
            mapIndex[w + c] = mapIndex.count + 1
        }
        index = i
    }

    return ans
}
