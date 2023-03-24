//
//  영어 끝말잇기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/24.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var checkWords = Set<String>()
    var ans = [0,0]
    for (i,c) in words.enumerated(){
        if(checkWords.contains(c) || (i >= 1 && c.first! != words[i-1].last!)){
            ans = [i % n + 1, i / n + 1]; break
        }
        checkWords.insert(c)
    }
    return ans
}
