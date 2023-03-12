//
//  신규 아이디 추천.swift
//  AlgorithmReview
//
//  Created by 박소윤 on 2023/03/12.
//

import Foundation

func solution(_ new_id:String) -> String {

    //1-3단계
    var id = Array(new_id)
    var convertId = [String]()

    for index in 0..<id.count{

        let char = id[index]
        let string = String(id[index])

        if(char.isLetter){
            convertId.append(string.lowercased())
        }else if(char.isNumber || string == "-" || string == "_"){
            convertId.append(string)
        }else if(string == "."){
            if(convertId.last ?? "" != "."){
                convertId.append(string)
            }
        }
    }

    //4단계
    if(convertId.first ?? "" == "."){
        convertId.removeFirst()
    }
    if(convertId.last ?? "" == "."){
        convertId.removeLast()
    }
    
    //6단계
    if(convertId.count > 15){
        convertId = Array(convertId[0..<15])
        if(convertId.last! == "."){
            convertId.removeLast()
        }
    }else if(convertId.count < 3){
        convertId += [String](repeating: convertId.last ?? "a", count: 3 - convertId.count)
    }
    return convertId.joined()
}
