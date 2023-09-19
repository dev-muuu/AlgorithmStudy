//
//  순위 검색.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/08/21.
//

import Foundation

func timeout(_ info:[String], _ query:[String]) -> [Int] {
    
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
        let scoreS = split.removeLast()
        let score = Int(scoreS)!
        makeQ(split, score)
    }
    
    var ans = [Int]()
    for q in query {
        var q = q.replacingOccurrences(of: " and ", with: " ").split(separator: " ")
        let targetS = Int(q.removeLast())!
        let targetQ = q.joined()
        let scores = (dict[targetQ] ?? []).sorted()

        var index = 0
        while index < scores.count && scores[index] < targetS {
            index += 1
        }
        ans.append(scores.count-index)
    }
    return ans
}
