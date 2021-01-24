//
//  ViewController.swift
//  QuizSP
//
//  Created by Алексей Красиков on 16.08.2020.
//  Copyright © 2020 Алексей Красиков. All rights reserved.
//

import UIKit

class IntroducionViewController: UIViewController {

    @IBOutlet var warningLabel: UILabel!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var secondNameTextField: UITextField!
    @IBOutlet var groupLabel: UILabel!
    @IBOutlet var pickerView: UIPickerView!

    var person: Person = Person(firstName: "", secondName: "", group: "")
    
    var selectedNameOfGroup: String?
    var selectedFirstNumberOfGroup: String?
    var selectedSecondNumberOfGroup: String?
    
    
    var groupData = Group()
    override func viewDidLoad() {
        super.viewDidLoad()
        groupLabel.text = ""
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
    
    
    @IBSegueAction func showQuestions(_ coder: NSCoder) -> QuestionsViewController? {
        return QuestionsViewController(coder: coder, person: person)
    }
    
    
    
    @IBAction func startTextTapped(_ sender: UIButton) {
        if let firstName = firstNameTextField.text,
            let secondName = secondNameTextField.text{
            if firstName != "" && secondName != ""{
                if let groupName = groupLabel.text{
                    if groupName != ""{
                        person.firstName = firstName
                        person.secondName = secondName
                        person.group = groupName
                        performSegue(withIdentifier: "Testing.", sender: self)
                    } else {
                        warningLabel.text = "Выберите группу"
                        warningLabel.textColor = UIColor.red
                    }
                }
            }
            else {
                warningLabel.text = "Введите имя и фамилию"
                warningLabel.textColor = UIColor.red
            }
            
            
        }
    }
    
    
    
    
    
    
}



extension IntroducionViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return groupData.nameOfGroup.count
        case 1:
            return groupData.firstNumberOfGroup.count
        case 2:
            return groupData.secondNumberOfGroup.count
        default:
            return 0
        }
    }
}


extension IntroducionViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let nameOfGroup = groupData.nameOfGroup[row]
            return nameOfGroup
        } else if component == 1{
            let firstNumberOfGroup = groupData.firstNumberOfGroup[row]
            return String(firstNumberOfGroup)
        } else {
            let secondNumberOfGroup = groupData.secondNumberOfGroup[row]
            return String(secondNumberOfGroup)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let name = groupData.nameOfGroup[row]
            selectedNameOfGroup = name
        } else if component == 1 {
            let first = groupData.firstNumberOfGroup[row]
            selectedFirstNumberOfGroup = first
        } else {
            let second = groupData.secondNumberOfGroup[row]
            selectedSecondNumberOfGroup = second
        }
        if let name = selectedNameOfGroup, let first = selectedFirstNumberOfGroup, let second = selectedSecondNumberOfGroup {
            if row != 0{
                groupLabel.text = "\(name)-\(first)\(second)"
                
            } else {
                groupLabel.text = ""
                
            }
            
        }
    }
    
    
    
}
