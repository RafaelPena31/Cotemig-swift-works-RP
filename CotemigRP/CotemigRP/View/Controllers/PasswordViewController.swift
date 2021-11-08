//
//  PasswordViewController.swift
//  CotemigRP
//
//  Created by Rafael Augusto Mesquita on 08/11/21.
//

import UIKit
import Firebase

class PasswordViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var EmailTxt: UITextField!
    
    @IBAction func InvitePass(_ sender: UIButton) {
        if let email = EmailTxt.text, email.count > 0 {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    self.handleError(error)
                } else {
                    let alert = CoreAlerts().handleDefaultAlert(title: "Informa", message: "Caso exista um cadastro com este e-mail em nossa base de dados, enviaremos um link de recuperação de senha.", buttonText: "OK")
                    self.present(alert, animated: true)
                }
            }
                                          
        } else {
            let alert = CoreAlerts().handleInputErrorAlert()
            self.present(alert, animated: true)
        }
    }
    
    private func handleError(_ error: Error) {
        print(error)
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
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "A senha enviada é inválida", buttonText: "OK")
            self.present(alert, animated: true)
            break
        default:
            break
        }
    }
}
