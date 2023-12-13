//
//  방금 그곡.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/24.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    let m = convert(m)
    
    var result = ("(None)", 0) //곡 제목, 재생 시간
    
    for info in musicinfos {
        let data = info.split(separator: ",").map{ String($0) }
        let playtime = time(data[1]) - time(data[0])
        if isContain(convert(data[3]), playtime) && result.1 < playtime {
            result = (data[2], playtime)
        }
    }
    
    return result.0
    
    func convert(_ string: String) -> String {
        return string
        .replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
    }
    
    func time(_ t: String) -> Int {
        let split = t.split(separator: ":").map{ Int($0)! }
        return split[0]*60 + split[1]
    }
    
    func isContain(_ base: String, _ playtime: Int) -> Bool {
        var play = String(repeating: base, count: playtime/base.count+1)
        play = String(play.prefix(playtime))
        return play.contains(m)
    }
}
