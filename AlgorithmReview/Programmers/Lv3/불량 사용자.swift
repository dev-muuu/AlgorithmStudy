//
//  불량 사용자.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/10.
//

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    //가능한 케이스 정리
    var map = [[Int]](repeating: [], count: banned_id.count)
    for (idx_i, i) in banned_id.enumerated(){
        let array_i = Array(i)
        for (idx_j,j) in user_id.enumerated(){
            if array_i.count != j.count { continue }
            let array_j = Array(j)
            var validation = true
            for k in 0..<array_i.count{
                if array_i[k] != "*" && array_i[k] != array_j[k] {
                    validation = false; break
                }
            }
            if validation {
                map[idx_i].append(idx_j)
            }
        }
    }

    var visit = [Bool](repeating: false, count: user_id.count)
    var ans = Set<Set<Int>>()
    func dfs(index: Int, array: [Int]){
        if index == banned_id.count {
            ans.insert(Set(array)); return
        }
        for i in map[index]{
            if !visit[i] {
                visit[i] = true
                dfs(index: index + 1, array: array + [i])
                visit[i] = false
            }
        }
    }
    dfs(index: 0, array: [])
    
    return ans.count
}
