//
//  다단계 칫솔 판매.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/18.
//

import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    //역방향 트리 구성
    let top = "minho"
    var tree = [String:(Int,String)]() //(자신의 인덱스, 추천자)
    for i in 0..<enroll.count {
        let p = referral[i]
        let e = enroll[i]
        tree[e] = (i , p == "-" ? top : p)
    }

    var ans = [Int](repeating: 0, count: enroll.count)
    for i in 0..<seller.count {
        var remain = amount[i] * 100
        var node = seller[i]
        while tree[node] != nil {
            let (idx, p) = tree[node]!
            let give = Int(Double(remain) * 0.1)
            if give < 1 {
                ans[idx] += remain
                break
            }
            ans[idx] += remain - give
            remain = give
            node = p
        }
    }
    return ans
}
