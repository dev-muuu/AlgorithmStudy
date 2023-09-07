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


func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var visit = [Bool](repeating: false, count: dungeons.count)
    func combination(_ array: [Int]){
        if array.count == dungeons.count {
            calculate(array); return
        }
        for i in 0..<dungeons.count {
            if !visit[i] {
                visit[i] = true
                combination(array + [i])
                visit[i] = false
            }
        }
    }
    
    var ans = 0
    func calculate(_ array: [Int]){
        var k = k
        var round = 0
        for i in array {
            let p = dungeons[i]
            if p[0] > k { break }
            round += 1
            k -= p[1]
        }
        ans = max(round, ans)
    }
    
    combination([])
    return ans
}
