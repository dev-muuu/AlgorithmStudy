//
//  n진수 게임.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/12.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {

    func getRadix(){
        let radix: [String] = String(num, radix: n).map{ $0.uppercased() }
        map.append(contentsOf: radix)
        num += 1
    }
    
    var map: [String] = [" "]
    var num = 0
    var ans = ""
    for i in 0..<t{
        while m*i+p >= map.count {
            getRadix()
        }
        ans.write("\(map[m*i+p])")
    }
    return ans
}
