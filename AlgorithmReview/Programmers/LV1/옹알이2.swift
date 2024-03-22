//
//  옹알이2.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/08.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    
    let map = ["a": "aya", "y":"ye", "w":"woo", "m":"ma"]
    
    var answer = 0
    for b in babbling {
        let b = Array(b).map{ String($0) }
        var pre = ""
        var index = 0
        while index < b.count {
            let c = b[index]
            if map[c] == nil || pre == map[c] || index+map[c]!.count > b.count || b[index..<index+map[c]!.count].joined() != map[c]{
                break
            }
            pre = b[index..<index+map[c]!.count].joined()
            index += map[c]!.count
        }
        if index == b.count {
            answer += 1
        }
    }
    
    return answer
}

func reference(_ babbling:[String]) -> Int {
    var count: Int = 0
    for element in babbling {
        var str = String(element)
        str = str.replacingOccurrences(of: "aya", with: "1")
        str = str.replacingOccurrences(of: "ye", with: "2")
        str = str.replacingOccurrences(of: "woo", with: "3")
        str = str.replacingOccurrences(of: "ma", with: "4")
        if Int(str) != nil && !str.contains("11") && !str.contains("22") && !str.contains("33") && !str.contains("44"){
            count += 1
        }
    }
    return count
}
