//
//  ToDoTableViewController.swift
//  popIt
//
//  Created by Ella Isgar on 8/14/19.
//  Copyright © 2019 Ella Isgar. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var toDos : [ToDoCD] = []
    
//    func createToDos() -> [ToDo] {
//        let first = ToDo()
//
//        let second = ToDo()
//
//        print(toDos)
//
//        return [first, second]
//    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        //var theDatePart = "(" + toDo.date + ")"
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        
        dateFormatter.timeStyle = .short
        
        let dateString = dateFormatter.string(from: toDo.date!)
        
        if toDo.importance{
                cell.textLabel?.text = " 🔴 " + toDo.name! + "-" + dateString
            } else {
                cell.textLabel?.text = " ✳️ " + toDo.name! + "-" + dateString
            }
    
        return cell
        
        //+ "(" + toDo.date + ")"
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? ToDoCD {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let toDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                toDos = coreDataToDos
                tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
}
