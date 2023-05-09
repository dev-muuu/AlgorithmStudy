//
//  피로도.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/09.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {

    var visit = [Bool](repeating: false, count: dungeons.count)
    var ans = 0
    func permutation(node: Int, array: [Int]){

        if array.count == dungeons.count {
            var remain = k
            var count = 0
            for i in array{
                if remain >= dungeons[i][0]{
                    remain -= dungeons[i][1]
                    count += 1
                }
            }
            ans = max(ans, count)
            return
        }

        for i in 0..<dungeons.count{
            if !visit[i] {
                visit[i] = true
                permutation(node: i, array: array + [i])
                visit[i] = false
            }
        }
    }
    permutation(node: 0, array: [])
    return ans
}
