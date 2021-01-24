//
//  QuestionsViewController.swift
//  QuizSP
//
//  Created by Алексей Красиков on 16.08.2020.
//  Copyright © 2020 Алексей Красиков. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!

    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var completeStackView: UIStackView!
    @IBOutlet var completeTextField: UITextField!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    var person: Person
    
    
    var questions: [Question] = [
        Question(text: "В каком году в РФ была принята конституция?",
                 type: .single,
                 answers: ["1991", "1993", "1974", "2000"]),
        Question(text: "Назовите столицу Парижа",
                 type: .complete,
                 answers: [])
    ]
    
    var answersChosen: [String] = []
    
    var questionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    init?(coder: NSCoder, person: Person) {
        self.person = person
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        completeStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Вопрос №\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleView(using: currentAnswer)
        case .complete:
            completeStackView.isHidden = false
        }
    }
    
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results.", sender: nil)
        }
    }
    
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen, person: person)
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        switch sender {
        case singleButton1:
            answersChosen.append(singleButton1.currentTitle!)
        case singleButton2:
            answersChosen.append(singleButton2.currentTitle!)
        case singleButton3:
            answersChosen.append(singleButton3.currentTitle!)
        case singleButton4:
            answersChosen.append(singleButton4.currentTitle!)
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func completeButtonPressed() {
        if let answer = completeTextField.text {
            answersChosen.append(answer)
        }
        
        nextQuestion()
    }
    func updateSingleView(using answers: [String]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0], for: .normal)
        singleButton2.setTitle(answers[1], for: .normal)
        singleButton3.setTitle(answers[2], for: .normal)
        singleButton4.setTitle(answers[3], for: .normal)
    }
    
    func updateCompleteView() {
        completeStackView.isHidden = false
        completeTextField.text = ""
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
