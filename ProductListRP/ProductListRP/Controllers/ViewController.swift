//
//  ViewController.swift
//  ProductListRP
//
//  Created by Rafael Augusto Mesquita on 20/09/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTIES
    
    var product: [Product] = []
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - PRIVATE
    
    private func getData() {
        guard let path = Bundle.main.path(forResource: "product", ofType: "json") else {
            print("Não encontrado")
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Product].self, from: data)
            
            product = jsonData
            tableView.reloadData()
        } catch {
            print("error:\(error)")
        }
    }
    
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
}

// MARK: - TABLE VIEW METHODS

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product", for: indexPath) as! ProductCell
        let product = product[indexPath.row]
        
        cell.Name.text = product.name
        cell.Description.text = product.description
        cell.Price.text = getFormatter(product.price)
        
        return cell
    }
}
