//
//  이모티콘 할인행사.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/18.
//

import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    let discount = [10, 20, 30, 40]
    
    var ans = [0,0]
    func price(_ comb: [(Int, Int)]){
        var temp = [0, 0]
        for user in users {
            var tempPrice = 0
            for i in comb {
                if i.0 >= user[0] {
                    tempPrice += emoticons[i.1] * (100-i.0) / 100
                }
            }
            if tempPrice >= user[1] {
                temp[0] += 1
            } else {
                temp[1] += tempPrice
            }
        }
        if ans[0] < temp[0] {
            ans = temp
        } else if ans[0] == temp[0] && ans[1] < temp[1] {
            ans[1] = temp[1]
        }
    }
    
    func emoticonsDiscount(_ data: [(Int, Int)]) {
        if data.count == emoticons.count {
            price(data); return
        }
        for d in discount {
            emoticonsDiscount(data + [(d, data.count)])
        }
    }
    
    emoticonsDiscount([])
    return ans
}
