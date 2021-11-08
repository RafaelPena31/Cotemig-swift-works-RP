//
//  LoginUserViewController.swift
//  CotemigRP
//
//  Created by Rafael Augusto Mesquita on 08/11/21.
//

import UIKit
import Firebase

class LoginUserViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateAccount" {
            let destination = segue.destination as! CreateUserViewController
            destination.delegate = self
        }
    }
    
    
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var PassTxt: UITextField!
    @IBAction func SignIn(_ sender: Any) {
        if let email = EmailTxt.text, let pass = PassTxt.text, email.count > 0 && pass.count >= 6 {
            Auth.auth().signIn(withEmail: email, password: pass) { authResult, error in
                if let error = error {
                    self.handleError(error)
                } else {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "SignIn", sender: nil)
                    }
                }
            }
        } else {
            let alert = CoreAlerts().handleInputErrorAlert()
            self.present(alert, animated: true)
        }
    }
    @IBAction func CreateAccountRedirect(_ sender: UIButton) {
        
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
        default:
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "Erro ao logar", buttonText: "OK")
            self.present(alert, animated: true)
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}


extension LoginUserViewController: CreateUserViewControllerDelegate {
    func didCreateUser(createUserViewController: CreateUserViewController) {
        createUserViewController.dismiss(animated: false, completion: nil)
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "SignIn", sender: nil)
        }
    }
}
