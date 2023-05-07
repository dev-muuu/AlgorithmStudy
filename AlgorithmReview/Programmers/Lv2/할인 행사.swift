//
//  할인 행사.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/07.
//

import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var map = [String:Int]()
    for i in 0..<want.count{
        map[want[i]] = number[i]
    }

    var productCount = [Int](repeating: 0, count: discount.count)
    func count(node: Int, time: Int){
        productCount[time] = discount[time..<min(node+10, discount.count)].reduce(0){
            $1 == discount[time] ? $0 + 1 : $0
        }
    }
    
    var ans = 0
    for node in 0..<discount.count{
        var buy = [String:Bool]()
        for i in node..<min(node+10, discount.count){
            count(node: node, time: i)
            if let target = map[discount[i]] {
                if target <= productCount[i] {
                    buy[discount[i]] = true
                }
            }
        }
        if buy.count == want.count{
            ans += 1
        }
    }
    return ans
}
