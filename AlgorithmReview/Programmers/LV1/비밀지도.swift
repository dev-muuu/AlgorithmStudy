//
//  비밀지도.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/02/16.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    var answer = [[String]](repeating: [String](repeating: "", count: n), count: n)
    
    func digit(_ num: Int) -> [String] {
        let radix = Array(String(num, radix:2)).map{ String($0) }
        return [String](repeating: "0", count: n-radix.count) + radix
    }
    
    for i in 0..<n {
        let map1 = digit(arr1[i])
        let map2 = digit(arr2[i])
        for j in 0..<n {
            answer[i][j] = map1[j] == "0" && map2[j] == "0" ? " " : "#"
        }
    }
    
    return answer.map{ $0.joined() }
}
