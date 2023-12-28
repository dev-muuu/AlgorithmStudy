//
//  모음 사전.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/20.
//

import Foundation

func solution(_ word:String) -> Int {

    let w = ["A","E","I","O","U"]
    
    var count = -1
    var ans = 0
    func dfs(_ str: String) {
        
        count += 1
        
        if str == word {
            ans = count
            return
        }
        if str.count == 5 {
            return
        }
        
        for i in w {
            dfs(str + i)
        }
        
    }
    
    dfs("")
    
    return ans
    
}
