//
//  방금 그곡.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/06/24.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    func makeTime(_ string: String) -> Int{
        let time = string.split(separator: ":").map{ Int($0)! }
        return time[0] * 60 + time[1]
    }
    
    func replacing(_ string: String) -> String{
        return string
            .replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a")
    }
    
    var ans = ("(None)", 0)
    var m = replacing(m)
    
    for music in musicinfos{
        
        var music = music.split(separator: ",").map{ String($0) }
        music[3] = replacing(music[3])
        
        let time = makeTime(music[1]) - makeTime(music[0]) + 1
        if time < m.count {
            continue
        }

        let repeatNum = time / music[3].count + (time % music[3].count == 0 ? 0 : 1)
        let song = music[3].count > time ? Array(music[3]).map{String($0)}[0..<time].joined() : String(repeating: music[3], count: repeatNum)
        
        if song.contains(m) && ans.1 < time {
            ans = (music[2], time)
        }
    }
    return ans.0
}
