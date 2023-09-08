//
//  숫자 변환하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/26.
//

import Foundation

func reference(_ x:Int, _ y:Int, _ n:Int) -> Int {

    var dp = [Int](repeating: Int.max/2, count: y+1)
    dp[x] = 0
    for j in x...y{
        if j * 2 <= y{
            dp[j*2] = min(dp[j*2], dp[j] + 1)
        }
        if j * 3 <= y{
            dp[j*3] = min(dp[j*3], dp[j] + 1)
        }
        if j + n <= y {
            dp[j+n] = min(dp[j+n], dp[j] + 1)
        }
    }
    return dp[y] == Int.max / 2 ? -1 : dp[y]
}

func retry(_ x:Int, _ y:Int, _ n:Int) -> Int {
    
    if x == y { return 0 }
    var temp = [(y, 0)]
    
    func check(_ value: Int, _ count: Int) -> Bool{
        if value == x {
            return true
        } else if value > x {
            temp.append((value, count))
        }
        return false
    }
    
    var index = 0
    while index != temp.count {
        let pop = temp[index]
        index += 1
        
        var exp = [Int]()
        if pop.0 % 3 == 0 {
            exp.append(pop.0/3)
        }
        if pop.0 % 2 == 0 {
            exp.append(pop.0/2)
        }
        exp.append(pop.0-n)
        
        for i in exp {
            if check(i, pop.1+1) {
                return pop.1+1
            }
        }
    }
    return -1
}
