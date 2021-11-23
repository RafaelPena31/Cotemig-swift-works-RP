//
//  CreateGradeViewController.swift
//  Notas RP
//
//  Created by Rafael Augusto Mesquita on 22/11/21.
//

import UIKit

class CreateGradeViewController: UIViewController {
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var GradeTextField: UITextField!
    
    
    public var grades: [Grade]!

    public weak var delegate: CreateGradeDelegate?

    @IBAction func onHandleSaveNewGrade(_ sender: UIButton) {
        let name = NameTextField.text ?? ""
        let grade = GradeTextField.text ?? ""
        
        if name.isEmpty || grade.isEmpty {
            let errorAlert = UIAlertController(title: "Dados Inválidos", message: "Preencha todos os campos com dados valídos", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: .none))
            self.present(errorAlert, animated: true)
        } else {
            print("entrou")

            let newGrade = Grade(name: name, grade: Float(grade) ?? 0)
            
            delegate?.saveNewGrade(newGrade)
            
            self.dismiss(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
