//
//  기저국 설치.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/08.
//

import Foundation

func reference(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    
    var ans = 0
    var start = 1
    let W = 2 * w + 1
    
    for i in stations{
        let a =  max(i - w - start, 0)
        var install = a / W
        if a % W != 0 {
            install += 1
        }
        ans += install
        start = i + w + 1
    }
    
    if start <= n {
        var install = (n - start + 1) / W
        if (n - start + 1) % W != 0 {
            install += 1
        }
        ans += install
    }
    
    return ans
}

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    
    var range = [(Int, Int)]()
    for i in 0..<stations.count {
        
        var start = 1
        if i > 0 {
            start = stations[i-1] + w + 1
        }
        let end = stations[i] - w - 1
        
        range.append((start, end))
    }
    
    if stations.last! != n {
        range.append((stations.last!+w+1,n))
    }

    var answer = 0
    for (s, e) in range {
        answer += (e-s+1) / (2*w+1)
        if (e-s+1) % (2*w+1) > 0 {
            answer += 1
        }
    }
    return answer
}
