//
//  CreateUserViewController.swift
//  CotemigRP
//
//  Created by Rafael Augusto Mesquita on 08/11/21.
//

import UIKit
import Firebase

class CreateUserViewController: UIViewController {
    public weak var delegate: CreateUserViewControllerDelegate?
    
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PassTxt: UITextField!
    @IBOutlet weak var ConfirmPassTxt: UITextField!
    @IBAction func CreateUser(_ sender: UIButton) {
        if let email = EmailTxt.text, let pass = PassTxt.text, let confirmPass = ConfirmPassTxt.text {
            let isInputDataAvailable = email.count > 0 && pass.count >= 6 && confirmPass.count >= 6 && pass == confirmPass
            guard isInputDataAvailable else {
                let alert = CoreAlerts().handleInputErrorAlert()
                self.present(alert, animated: true)
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
                if let error = error {
                    self.handleError(error)
                } else {
                    self.delegate?.didCreateUser(createUserViewController: self)
                }
            }
        }
    }
    
    private func handleError(_ error: Error) {
        let fbError = CreateUserError(rawValue: error.localizedDescription)
        switch fbError {
        case .badFormat:
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "O email enviado não possui o formato válido", buttonText: "OK")
            self.present(alert, animated: true)
            break
        case .alreadyUse:
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "O email já está sendo utilizado em outra conta", buttonText: "OK")
            self.present(alert, animated: true)
            break
        case .passwordInvalid:
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "A senha enviada precisa ter no mínimo 6 caracteres", buttonText: "OK")
            self.present(alert, animated: true)
            break
        default:
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "Erro ao criar conta", buttonText: "OK")
            self.present(alert, animated: true)
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

protocol CreateUserViewControllerDelegate: AnyObject {
    func didCreateUser(createUserViewController: CreateUserViewController)
}
