//
//  광물 캐기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/07/28.
//

import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    
    let picksAmount = picks.reduce(0) { $0 + $1 }
    var mineralsCount = [[Int]]()
    var mineralIndex = 0
    while mineralIndex < minerals.count && mineralsCount.count < picksAmount{
        mineralsCount.append([0,0,0])
        let storageIndex = mineralIndex / 5
        let endIndex = min(mineralIndex + 5, minerals.count)
        while mineralIndex < endIndex {
            switch minerals[mineralIndex]{
                case "diamond":     mineralsCount[storageIndex][0] += 1
                case "iron":        mineralsCount[storageIndex][1] += 1
                case "stone":       mineralsCount[storageIndex][2] += 1
                default:    break
            }
            mineralIndex += 1
        }
    }
    
    var pickCombination = Set<[Int]>()
    func combination(_ use: [Int], _ count: [Int]){
        
        if use.count == mineralsCount.count {
            pickCombination.insert(use); return
        }
        
        for i in 0...2{
            if count[i] + 1 <= picks[i] {
                var newUse = count
                newUse[i] += 1
                combination(use + [i] ,newUse)
            }
        }
    }
    
    combination([], [0,0,0])

    var ans = Int.max
    let score = [[1,1,1], [5,1,1], [25,5,1]]
    for comb in pickCombination{
        var count = 0
        for i in 0..<comb.count {
            let pick = score[comb[i]]
            count += (0...2).reduce(0){ $0 + mineralsCount[i][$1] * pick[$1]}
        }
        ans = min(ans, count)
    }
    
    return ans
}
