//
//  소수 찾기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/29.
//

import Foundation

func solution(_ numbers:String) -> Int {
    
    let numbers = Array(numbers).map{ String($0) }
    var numberSet = Set<Int>()
    
    var visit = [Bool](repeating: false, count: numbers.count)
    func dfs(_ string: String){
        
        let num = Int(string) ?? 0
        numberSet.insert(num)
        
        for i in 0..<numbers.count{
            if !visit[i]{
                visit[i] = true
                dfs(string + numbers[i])
                visit[i] = false
            }
        }
    }
    
    dfs("")
    
    numberSet.remove(0)
    numberSet.remove(1)
    
    for num in numberSet{
        for i in stride(from: 2, to: Int(sqrt(Double(num))) + 1, by: +1){
            if num % i == 0 {
                numberSet.remove(num)
            }
        }
    }
    
    return numberSet.count
}
