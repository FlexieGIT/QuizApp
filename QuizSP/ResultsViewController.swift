//
//  ResultsViewController.swift
//  QuizSP
//
//  Created by Алексей Красиков on 16.08.2020.
//  Copyright © 2020 Алексей Красиков. All rights reserved.
//

import UIKit
import SWMailgun

class ResultsViewController: UIViewController {

    var responses: [String]
    var person: Person
    
    var withoutError: Bool = true
    
    let service = MailgunService()

    
    //domain and api from MailGun
    let auth = MailgunAuth(
        domain: "****",
        apiKey: "****"
    )
    
    
    init?(coder: NSCoder, responses: [String], person: Person) {
        self.responses = responses
        self.person = person
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        for answer in responses {
            print("\(answer)\n")
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBSegueAction func showSender(_ coder: NSCoder) -> SenderViewController? {
        return SenderViewController(coder: coder, withoutError: withoutError)
    }
    

    @IBAction func sendButtonPressed() {
        var answers: String = ""
        var index: Int = 1
        for answer in responses{
            answers += "\(index) - \(answer)\n"
            index += 1
        }
        //type your email where you want to get results
        let email = MailgunEmail(
            from: "Bonch@summerPractice.com",
            to: "mail@mail.com",
            subject: "Результаты тестирования",
            text: "\(person.firstName) \(person.secondName) из группы \(person.group) прошёл тестирование.\n\(answers)"
        )
        service.send(email: email, auth: auth) { result, error in
            guard let result = result else {
                self.withoutError.toggle()
                print("Error: \(String(describing: error))")
                return
            }
            print("Email was sent: \(result.isSent())")
        }
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
