//
//  기저국 설치.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/08.
//

import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    
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
