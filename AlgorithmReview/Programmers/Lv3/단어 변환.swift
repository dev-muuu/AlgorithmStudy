//
//  단어 변환.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/06.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {

    var visit = [Bool](repeating: false, count: words.count)
    var ans = Int.max
    
    func dfs(node: String, time: Int){

        if node == target {
            ans = min(time, ans); return
        }

        let node = Array(node)
        for i in 0..<words.count{
            
            if visit[i] { continue }
            
            let candidate = Array(words[i])
            var diff = 0
            for j in 0..<node.count{
                if node[j] != candidate[j]{
                    diff += 1
                    if diff > 1 { break }
                }
            }
            
            if diff == 1 {
                visit[i] = true
                dfs(node: words[i], time: time + 1)
                visit[i] = false
            }
        }
    }
    dfs(node: begin, time: 0)
    return ans == Int.max ? 0 : ans
}
