//
//  방금 그곡.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/24.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    let m = replace(m)
    
    func check(_ time: Int, _ music: String) -> Bool {
        
        var music = replace(music)
        music = String(repeating: music, count: time/music.count+1)
        music = String(music.prefix(time))
        
        if music.contains(m) && ans.0 < time {
            return true
        }
        return false
    }
    
    var ans = (0, "(None)")
    
    for m in musicinfos{
        let info = m.split(separator: ",").map{ String($0) }
        let time = convertTime(info[1]) - convertTime(info[0])
        if check(time, info[3]){
            ans = (time, info[2])
        }
    }
    
    return ans.1
}

func replace(_ string: String) -> String {
    return string
        .replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
}

func convertTime(_ value: String) -> Int{
    let split = value.split(separator: ":")
    return Int(split[0])! * 60 + Int(split[1])!
}
