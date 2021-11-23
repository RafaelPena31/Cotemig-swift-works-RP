//
//  CoreAlerts.swift
//  Notas RP
//
//  Created by Rafael Augusto Mesquita on 22/11/21.
//

import UIKit

class CoreAlerts {
    public func handleDefaultAlert(title: String, message: String, buttonText: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
        
        return alert
    }
    
    public func handleErrorAlert(title: String, message: String, buttonText: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .destructive, handler: nil))
        
        return alert
    }
    
    public func handleInputErrorAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Atenção", message: "Preencha corretamenta os dados", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
        
        return alert
    }
}
