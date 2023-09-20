//
//  순위 검색.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/21.
//

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    let comb = [[],[1],[2],[3],[4],[1,2],[1,3],[1,4],[2,3],[2,4],[3,4],[1,2,3],[1,2,4],[1,3,4],[2,3,4],[1,2,3,4]]
    func makeQ(_ info: [String], _ score: Int) {
        for c in comb {
            var q = info
            for i in c {
                q[i-1] = "-"
            }
            let que = q.joined()
            if dict[que] == nil {
                dict[que] = []
            }
            dict[que]!.append(score)
        }
    }

    var dict = [String:[Int]]()
    for i in info {
        var split = i.split(separator: " ").map{ String($0) }
        let score = Int(split.removeLast())!
        makeQ(split, score)
    }
    for (k, v) in dict {
        dict[k] = v.sorted()
    }
    
    var ans = [Int]()
    for q in query {
        var q = q.replacingOccurrences(of: " and ", with: " ").split(separator: " ")
        let targetS = Int(q.removeLast())!
        let targetQ = q.joined()
        let scores = (dict[targetQ] ?? [])

        var l = 0, r = scores.count-1
        while l <= r {
            let mid = (l+r)/2
            if scores[mid] < targetS {
                l = mid+1
            } else {
                r = mid-1
            }
        }
        ans.append(scores.count-l)
    }
    return ans
}
