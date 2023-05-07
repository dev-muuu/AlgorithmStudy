//
//  타겟 넘버.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/08.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var ans = 0
    
    func dfs(index: Int, sum: Int){
        
        if index == numbers.count {
            if sum == target {
                ans += 1;
            }
            return
        }
        
        dfs(index: index + 1, sum: sum + numbers[index])
        dfs(index: index + 1, sum: sum - numbers[index])
    }
    
    dfs(index: 0, sum: 0)
    
    return ans
}
