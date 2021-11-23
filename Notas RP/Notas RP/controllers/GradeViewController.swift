//
//  GradeViewController.swift
//  Notas RP
//
//  Created by Rafael Augusto Mesquita on 22/11/21.
//

import UIKit
import Firebase
import CodableFirebase

class GradeViewController: UIViewController {
    let ref = Database.database().reference()
    let userId = Auth.auth().currentUser?.uid ?? ""
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func Logout(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        } catch let err {
            let errMsg = err.localizedDescription
            print(errMsg)
        }
    }
    
    var grades: [Grade] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add" {
            let destination = segue.destination as! CreateGradeViewController
            destination.grades = grades
            destination.delegate = self
        }
    }
    
    func getData() {
        ref.child("grades").child(userId).observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value else { return }
            do {
                let model = try FirebaseDecoder().decode([Grade].self, from: value)
                self.grades = model
                
                self.tableView.reloadData()
            } catch let error {
                print(error)
            }
        })
    }
}

extension GradeViewController: CreateGradeDelegate {
    func saveNewGrade(_ newGrade: Grade) {
        grades.append(newGrade)
        
        let gradesData = try! FirebaseEncoder().encode(grades)
        self.ref.child("grades").child(userId).setValue(gradesData) { error, ref in
            if let error = error {
                print("Data could not be saved: \(error).")
                let alert = CoreAlerts().handleDefaultAlert(title: "Informa", message: "Ocorreu um erro ao salvar os dados. Contate o suporte. \(error.localizedDescription)", buttonText: "OK")
                self.present(alert, animated: true)
            } else {
                let alert = CoreAlerts().handleDefaultAlert(title: "Informa", message: "Nota cadastrada com sucesso", buttonText: "OK")
                self.present(alert, animated: true)
            }
          }
        
        tableView.reloadData()
    }
}

extension GradeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        grades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gradeCell", for: indexPath) as! GradeCell
        let gradeItem = grades[indexPath.row]
        
        cell.LblName.text = gradeItem.name
        cell.LblGrade.text = String(gradeItem.grade)
        
        return cell
    }
}
