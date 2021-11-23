//
//  ViewController.swift
//  Notas RP
//
//  Created by Rafael Augusto Mesquita on 22/11/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    /*/
        AUTOR DO PROJETO
        MATRÍCULA: 11901322
        NÚMERO DE CHAMADA: 46
        NOME: RAFAEL AUGUSTO PENA PEREIRA MESQUITA
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateAccount" {
            let destination = segue.destination as! CreateAccountViewController
            destination.delegate = self
        }
    }
    
    @IBOutlet weak var TxtEmail: UITextField!
    @IBOutlet weak var TxtPass: UITextField!
    
    @IBAction func SignIn(_ sender: UIButton) {
        if let email = TxtEmail.text, let pass = TxtPass.text, email.count > 4 && pass.count >= 6 {
            Auth.auth().signIn(withEmail: email, password: pass) { authResult, error in
                if let error = error {
                    self.handleError(error)
                } else {
                    self.TxtEmail.text = ""
                    self.TxtPass.text = ""
                    
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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func handleError(_ error: Error) {
        print(error)
        let fbError = CreateUserError(rawValue: error.localizedDescription)
        switch fbError {
        case .badFormat:
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "O email enviado não possui o formato válido", buttonText: "OK")
            self.present(alert, animated: true)
            break
        case .passwordInvalid, .userNotExist:
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "E-mail ou senha inválidos para acessar o aplicativo", buttonText: "OK")
            self.present(alert, animated: true)
            break
        default:
            let alert = CoreAlerts().handleErrorAlert(title: "Atenção", message: "Erro ao logar", buttonText: "OK")
            self.present(alert, animated: true)
            break
        }
    }
}

extension ViewController: CreateAccountViewControllerDelegate {
    func didCreateUser(createUserViewController: CreateAccountViewController) {
        createUserViewController.dismiss(animated: false, completion: nil)
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "SignIn", sender: nil)
        }
    }
}
