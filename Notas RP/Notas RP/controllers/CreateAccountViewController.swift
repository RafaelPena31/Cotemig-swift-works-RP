//
//  CreateAccountViewController.swift
//  Notas RP
//
//  Created by Rafael Augusto Mesquita on 22/11/21.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {
    public weak var delegate: CreateAccountViewControllerDelegate?
    
    @IBOutlet weak var TxtEmail: UITextField!
    @IBOutlet weak var TxtConfirmEmail: UITextField!
    @IBOutlet weak var TxtPass: UITextField!
    @IBOutlet weak var TxtConfirmPass: UITextField!
    
    @IBAction func CreateAccount(_ sender: UIButton) {
        if let email = TxtEmail.text, let confirmEmail = TxtConfirmEmail.text, let pass = TxtPass.text, let confirmPass = TxtConfirmPass.text {
            let isInputDataAvailable = email.count > 4 && confirmEmail.count > 4 && email == confirmEmail && pass.count >= 6 && confirmPass.count >= 6 && pass == confirmPass
            guard isInputDataAvailable else {
                let alert = CoreAlerts().handleInputErrorAlert()
                self.present(alert, animated: true)
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
                if let error = error {
                    self.handleError(error)
                } else {
                    self.TxtEmail.text = ""
                    self.TxtConfirmEmail.text = ""
                    self.TxtPass.text = ""
                    self.TxtConfirmPass.text = ""
                    
                    self.delegate?.didCreateUser(createUserViewController: self)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

protocol CreateAccountViewControllerDelegate: AnyObject {
    func didCreateUser(createUserViewController: CreateAccountViewController)
}
