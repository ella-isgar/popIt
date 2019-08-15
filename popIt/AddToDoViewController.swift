//
//  AddToDoViewController.swift
//  popIt
//
//  Created by Ella Isgar on 8/15/19.
//  Copyright © 2019 Ella Isgar. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importanceSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto : context)
            
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.importance = importanceSwitch.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
            
        }
        
//        //code before coredata
//
//        let toDo = ToDo()
//
//        if let titleText = titleTextField.text {
//            toDo.name = titleText
//            toDo.importance = importanceSwitch.isOn
//        }
//
//        previousVC.toDos.append(toDo)
//        previousVC.tableView.reloadData()
//        navigationController?.popViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
