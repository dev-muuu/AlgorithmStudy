//
//  단어 변환.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/06.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    var answer = Int.max
    var visit = [Bool](repeating: false, count: words.count)
    
    func isValid(_ a: String, _ b: String) -> Bool {
        let a = Array(a)
        let b = Array(b)
        var diff = 0
        for i in 0..<a.count {
            if a[i] != b[i] {
                diff += 1
            }
            if diff > 1 {
                return false
            }
        }
        return true
    }
    
    func dfs(_ w: String, _ depth: Int) {
        if target == w {
            answer = min(answer, depth)
            return 
        }
        if depth >= answer {
            return
        }
        for (i, temp) in words.enumerated() {
            if visit[i] { continue }
            if isValid(temp, w) {
                visit[i] = true
                dfs(temp, depth + 1)
                visit[i] = false
            }
        }
    }
    
    dfs(begin, 0)
    
    if answer == Int.max {
        return 0
    }
    return answer
}
