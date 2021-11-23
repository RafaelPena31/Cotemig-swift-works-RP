//
//  RecoverPassViewController.swift
//  Notas RP
//
//  Created by Rafael Augusto Mesquita on 22/11/21.
//

import UIKit
import Firebase

class RecoverPassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var TxtEmail: UITextField!
    
    @IBAction func InvitePass(_ sender: UIButton) {
        if let email = TxtEmail.text, email.count > 0 {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                self.TxtEmail.text = ""
                
                let alert = CoreAlerts().handleDefaultAlert(title: "Informa", message: "Caso exista um cadastro com este e-mail em nossa base de dados, enviaremos um link de recuperação de senha.", buttonText: "OK")
                self.present(alert, animated: true)
            }
        } else {
            let alert = CoreAlerts().handleInputErrorAlert()
            self.present(alert, animated: true)
        }
    }
}
