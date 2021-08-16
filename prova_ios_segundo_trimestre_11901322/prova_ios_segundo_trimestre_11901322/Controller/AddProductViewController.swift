//
//  AddProductViewController.swift
//  prova_ios_segundo_trimestre_11901322
//
//  Created by Rafael Augusto Mesquita on 16/08/21.
//

import UIKit

class AddProductViewController: UIViewController {
    // MARK: - UI
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var DescriptionTextView: UITextView!
    @IBOutlet weak var PriceTextField: UITextField!
    
    // MARK: - PROPERTIES
    
    public var products: [Product]!
    
    // MARK: - PUBLIC API
    
    public weak var delegate: AddProductDelegate?
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - PRIVATE
    
    private func getFormatter(_ price: String) -> String {
        let currencyFormatter = NumberFormatter()
        
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.groupingSeparator = "."
        currencyFormatter.decimalSeparator = ","
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        
        let currentPrice = price.replacingOccurrences(of: ",", with: ".")
        
        return "R$ \(currencyFormatter.string(from: NSNumber(value: Float(currentPrice) ?? 0))!)"
    }
    
    // MARK: - ACTION

    @IBAction func onHandleSaveNewProduct(_ sender: UIButton) {
        let name = NameTextField.text ?? ""
        let description = DescriptionTextView.text ?? ""
        let price = PriceTextField.text ?? ""
        
        if name.isEmpty || description.isEmpty || price.isEmpty {
            let errorAlert = UIAlertController(title: "Dados Inválidos", message: "Preencha todos os campos com dados valídos", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: .none))
            self.present(errorAlert, animated: true)
        } else {
            let priceString = getFormatter(price)
            let newProduct = Product(name: name, description: description, price: priceString)
            
            delegate?.saveNewProduct(newProduct)
            
            navigationController?.popViewController(animated: true)
        }
    }
}
