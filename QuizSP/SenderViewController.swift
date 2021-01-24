//
//  SenderViewController.swift
//  QuizSP
//
//  Created by Алексей Красиков on 21.08.2020.
//  Copyright © 2020 Алексей Красиков. All rights reserved.
//

import UIKit

class SenderViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var withoutError: Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if withoutError {
            label.text = "Ваши ответы успешно отправлены преподавателю"
        } else {
            label.text = "К сожалению, произошла ошибка. Проверьте доступ к интернету и пройдите тест снова."
        }
    }
    
    init?(coder: NSCoder, withoutError: Bool) {
        self.withoutError = withoutError
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
