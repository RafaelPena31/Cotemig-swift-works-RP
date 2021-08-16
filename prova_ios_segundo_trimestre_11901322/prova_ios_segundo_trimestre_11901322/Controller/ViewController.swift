//
//  ViewController.swift
//  prova_ios_segundo_trimestre_11901322
//
//  Created by Rafael Augusto Mesquita on 16/08/21.
//

import UIKit

class ViewController: UIViewController {
    /*/
        AUTOR DO PROJETO
        MATRÍCULA: 11901322
        NÚMERO DE CHAMADA: 46
        NOME: RAFAEL AUGUSTO PENA PEREIRA MESQUITA
     */
    
    // MARK: - UI
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTIES
    
    var product: [Product] = []
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            let destination = segue.destination as! AddProductViewController
            destination.products = product
            destination.delegate = self
        }
    }
    
    // MARK: - ACTION
    
    @IBAction func AddProduct(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "add", sender: nil)
    }
}

// MARK: - EXTENDS

extension ViewController: AddProductDelegate {
    func saveNewProduct(_ newProduct: Product) {
        product.append(newProduct)
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
        cell.Price.text = product.price
        
        return cell
    }
}

