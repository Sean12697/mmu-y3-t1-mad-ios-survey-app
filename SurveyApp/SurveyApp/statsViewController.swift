//
//  statsViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit
import CoreData

class statsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var dataArr : [String] = [];
    let simpleTableIdentifier = "SimpleTableIdentifier"
    @IBOutlet weak var dataTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = getData()
        dataTable.dataSource = self
        dataTable.delegate = self
    }
    
    func getData() -> [String] {
        var data : [String] = [];
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [""] }
        let managedContext = appDelegate.persistentContainer.viewContext;
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for item in result as! [NSManagedObject] {
                data.append(item.value(forKey: "id") as! String);
                // item.value(forKey: "id") as? String
            }
        } catch {
            print("Failed");
        }
        
        return data;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:-
    // MARK: Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCell.CellStyle.default,
                reuseIdentifier: simpleTableIdentifier)
        }
        cell?.textLabel?.text = dataArr[indexPath.row]
        return cell!
    }
    
    // MARK:-
    // MARK: Table View delegate Methods
//    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
//        return indexPath.row % 4
//    }
//
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        return indexPath.row == 0 ? nil : indexPath
//    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let rowValue = dataArr[indexPath.row]
//        let message = "You selected \(rowValue)"
//
//        let controller = UIAlertController(title: "Row Selected",
//                                           message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: "Yes I Did",
//                                   style: .default, handler: nil)
//        controller.addAction(action)
//        present(controller, animated: true, completion: nil)
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return indexPath.row == 0 ? 120 : 70
//    }

}
