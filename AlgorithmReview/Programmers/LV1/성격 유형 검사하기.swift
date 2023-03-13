//
//  성격 유형 검사하기.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/13.
//

import Foundation

func getScore(_ choice: Int) -> Int{
    switch choice{
        case 1,7:   return 3
        case 2,6:   return 2
        case 3,5:   return 1
        default:    return 0
    }
}

func solution(_ survey:[String], _ choices:[Int]) -> String {

    var mapping = [("R", "T"), ("C","F"),("J","M"),("A","N")]
    var scoreCount: [String:Int] = ["R":0, "T":0,"C":0,"F":0,"J":0,"M":0,"A":0,"N":0]

    for i in 0..<survey.count{
        let character = Array(survey[i]).map{ String($0) }
        let score = getScore(choices[i])
        switch choices[i]{
            case 1,2,3: //비동의
            scoreCount[character[0]]! += score
            break
            case 5,6,7: //동의
            scoreCount[character[1]]! += score
            break
            default:
            break
        }
    }

    var result = [String]()
    for m in mapping{
        if(scoreCount[m.0]! > scoreCount[m.1]!){
            result.append(m.0)
        }else if(scoreCount[m.0]! < scoreCount[m.1]!){
            result.append(m.1)
        }else{
            m.0 < m.1 ? result.append(m.0) : result.append(m.1)
        }
    }
    return result.joined()
}
