//
//  표 편집.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/10/27.
//

import Foundation

func reference(_ n:Int, _ k:Int, _ cmd:[String]) -> String {

    var link = [Int: [Int]]()
    for i in 0..<n{
        link[i] = [i-1, i+1]
    }
    
    var k = k
    var remove = [(Int, Int, Int)]()
    var ans = [String](repeating: "O", count: n)
    for c in cmd {
        let c = Array(c).map{ String($0) }
        switch c.first! {
        case "C":
            let (pre, next) = (link[k]![0], link[k]![1])
            ans[k] = "X"
            link[pre]?[1] = next
            link[next]?[0] = pre
            remove.append((k, pre, next))
            k = next == n ? pre : next
        case "Z":
            let (idx, pre, next) = remove.removeLast()
            ans[idx] = "O"
            link[idx] = [pre, next]
            link[pre]?[1] = idx
            link[next]?[0] = idx
        default:
            let index = c.first! == "U" ? 0 : 1
            for _ in 1...Int(c[2...].joined())! {
                k = link[k]![index]
            }
        }
    }
    return ans.joined()
}
