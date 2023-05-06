//
//  뉴스 클러스트링.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/05/06.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {

    func makeMap(str: String) -> Dictionary<String,Int>{

        let str = Array(str.lowercased())
        var map = [String: Int]()

        for i in 0..<str.count-1{

            if !(str[i].asciiValue! >= 97 && str[i].asciiValue! <= 122
            && str[i+1].asciiValue! >= 97 && str[i+1].asciiValue! <= 122){ //"_" 아스키 코드 = 95 > 제외 필요
                continue
            }

            let key = "\(str[i])\(str[i+1])"

            if map[key] == nil{
                map[key] = 0
            }
            map[key]! += 1
        }
        return map
    }

    var map1 = makeMap(str: str1)
    var map2 = makeMap(str: str2)

    var intersection = 0
    var union = map1.values.reduce(0){ $0 + $1 } + map2.values.reduce(0){ $0 + $1 }
    for key in map1.keys{
        if let map1Value = map1[key], let map2Value = map2[key]{
            let value = min(map1Value, map2Value)
            intersection += value
            union -= value
        }
    }

    let ans: Double = union == 0 ? 1 : Double(intersection) / Double(union)
    return Int(ans * 65536)
}
