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
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto : context)
            
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.importance = importanceSwitch.isOn
                toDo.date = datePicker.date
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

}
