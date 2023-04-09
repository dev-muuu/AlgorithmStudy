//
//  캐시.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/04/09.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {

    var total = 0
    var cache = [String: Int]()

    for city in cities{
        let cityLowercase = city.lowercased()
        if cache[cityLowercase] != nil {
            total += 1
        }else{
            total += 5
            if cacheSize == 0 {
                continue
            }else if cache.count >= cacheSize{
                let removeCity = cache.min(by: { $0.value < $1.value})!
                cache.removeValue(forKey: removeCity.key)
            }
        }
        cache[cityLowercase] = total
    }
    return total
}
