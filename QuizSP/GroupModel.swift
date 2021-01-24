//
//  GroupModel.swift
//  QuizSP
//
//  Created by Алексей Красиков on 20.08.2020.
//  Copyright © 2020 Алексей Красиков. All rights reserved.
//

import Foundation

class Group{
    
    var nameOfGroup = [String]()
    var firstNumberOfGroup = [String]()
    var secondNumberOfGroup = [String]()
    
    init() {
        setupData()
    }
    
    func setupData() {
        nameOfGroup.append(" ")
        nameOfGroup.append("ИКТ")
        nameOfGroup.append("ИКПИ")
        nameOfGroup.append("ИКБ")
        
        firstNumberOfGroup.append("")
        firstNumberOfGroup.append("7")
        firstNumberOfGroup.append("8")
        firstNumberOfGroup.append("9")
        
        secondNumberOfGroup.append("")
        secondNumberOfGroup.append("1")
        secondNumberOfGroup.append("2")
        secondNumberOfGroup.append("3")
        secondNumberOfGroup.append("4")
        secondNumberOfGroup.append("5")
        
    }
    
}
