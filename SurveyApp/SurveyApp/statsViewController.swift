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
    let diff : [String] = ["Very Easy", "Easy", "Okay", "Difficult", "Very Hard"];
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
                let id:String = item.value(forKey: "id") as! String;
                let age:String = String(getAge(birthday: item.value(forKey: "dob") as! Date))
                let used:Bool = item.value(forKey: "q1") as! Bool;
                let usedString:String = (used) ? "Uses iPads for \(item.value(forKey: "q2a") as! String)" : "Finds iPads \(diff[item.value(forKey: "q2b") as! Int]) to use";
                let consider:String = (item.value(forKey: "q3") as! Bool) ? "will" : "won't";
                data.append("\(id) - Age: \(age), \(usedString) and \(consider) consider using an iPad again in the future");
                // item.value(forKey: "id") as? String
            }
        } catch {
            print("Failed");
        }
        
        return data;
    }
    
    func getAge(birthday: Date) -> Int {
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        return ageComponents.year!
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

}
