//
//  캐시.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/04/09.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var ans = 0
    var cache = [String: Int]()
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for (i, c) in cities.enumerated() {
        let c = c.lowercased()
        if cache[c] != nil { //hit
            ans += 1
        } else {
            ans += 5
            if cache.count == cacheSize {
                let candidate = cache.min(by: { $0.value < $1.value })
                cache.removeValue(forKey: candidate!.key)
            }
        }
        cache[c] = i
    }
    return ans
}
