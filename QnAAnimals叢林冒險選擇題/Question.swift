//
//  Question.swift
//  QnAAnimals叢林冒險選擇題
//
//  Created by Rose on 2021/5/13.
//

import Foundation

struct Question {
    //問題圖片
    let image: String
    
    // 問題文字
    let description: String
    
    // 答案選項
    var option: [String]
    
    // 正確答案
    let answer: String
}
