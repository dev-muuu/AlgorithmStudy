//
//  모음 사전.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/20.
//

import Foundation

func solution(_ word:String) -> Int {
    
    let vowel: [String] = ["A", "E", "I", "O", "U"]
    var num = 0, ans = 0
    func dfs(string: String){
        if string == word {
            ans = num; return
        } else if string.count == 5 {
            return
        }
        
        for c in vowel{
            num += 1
            dfs(string: string + c)
        }
    }
    dfs(string: "")
    return ans
}
