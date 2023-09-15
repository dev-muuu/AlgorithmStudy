//
//  마법의 엘리베이터.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/18.
//

import Foundation

func reference(_ storey:Int) -> Int {
    var storey = String(storey).map{ Int(String($0))! }
    var ans = 0
    for i in stride(from: storey.count-1, to: -1, by: -1){
        if storey[i] > 5 {
            ans += 10 - storey[i]
            if i == 0 {
                ans += 1
            } else {
                storey[i-1] += 1
            }
        } else if storey[i] == 5 && i > 0 && storey[i-1] >= 5 {
            storey[i-1] += 1
            ans += 5
        } else {
            ans += storey[i]
        }
    }
    return ans
}

func solution(_ storey:Int) -> Int {
    
    let storey = String(storey).map{ Int(String($0))! }
    
    func value(_ standard: Int) -> Int {
        var index = storey.count-1
        var storey = storey
        while index > 0 {
            if storey[index] > standard {
                storey[index-1] += 1
                storey[index] = 10 - storey[index]
            }
            index -= 1
        }
        var start = 0
        if storey[0] > standard {
            start = 1
            storey[0] = 10 - storey[0]
        }
        return storey.reduce(start){ $0 + $1 }
    }
    
    return min(value(4), value(5))
}
