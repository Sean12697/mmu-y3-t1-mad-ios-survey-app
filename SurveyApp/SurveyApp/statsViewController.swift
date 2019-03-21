//
//  statsViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit
import CoreData
import MessageUI

class statsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataArr : [String] = [];
    let diff : [String] = ["Very Easy", "Easy", "Okay", "Difficult", "Very Hard"];
    let simpleTableIdentifier = "SimpleTableIdentifier"
    @IBOutlet weak var dataTable: UITableView!
    // For CSV
    let fileName = "Exports.csv"
    let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Exports.csv")
    var csvText = "ID,Age,Q1,Q2,Q3,Lat,Long\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = getData()
        dataTable.dataSource = self
        dataTable.delegate = self
    }
    
    @IBAction func sendEmailClick(_ sender: Any) {
        print(csvText)
        sendFile()
    }
    
    func getData() -> [String] {
        var data : [String] = [];
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [""] }
        let managedContext = appDelegate.persistentContainer.viewContext;
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            for item in result as! [NSManagedObject] {
                // For Stat View
                let id:String = item.value(forKey: "id") as! String;
                let age:String = String(getAge(birthday: item.value(forKey: "dob") as! Date))
                let used:Bool = item.value(forKey: "q1") as! Bool;
                let usedString:String = (used) ? "Uses iPads for \(item.value(forKey: "q2a") as! String)" : "Finds iPads \(diff[item.value(forKey: "q2b") as! Int]) to use";
                let consider:String = (item.value(forKey: "q3") as! Bool) ? "will" : "won't";
                data.append("\(id) - Age: \(age), \(usedString) and \(consider) consider using an iPad again in the future");
                // For CSV
                let newLine = "\(id),\(age),\(used),\(used ? item.value(forKey: "q2a") as! String : diff[item.value(forKey: "q2b") as! Int]),\(item.value(forKey: "q3") as! Bool),\(String(item.value(forKey: "lat") as! Float)),\(String(item.value(forKey: "long") as! Float))\n"
                csvText += newLine
            }
        } catch {
            print("Failed");
        }
        
        return data;
    }
    
    func sendFile() {
        do {
            try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            let vc = UIActivityViewController(activityItems: [path as Any], applicationActivities: [])
            present(vc, animated: true, completion: nil)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
    }
    
//    func sendEmail() {
//        do {
//        try csvText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
//            let email = "your email here"
//            let fileURL = URL(fileURLWithPath: path!)
//
//            let sharingService = NSSharingService(named: NSSharingServiceNameComposeEmail)
//            sharingService?.recipients = [email] //could be more than one
//            sharingService?.subject = "subject"
//            let items: [Any] = ["see attachment", fileURL] //the interesting part, here you add body text as well as URL for the document you'd like to share
//
//            sharingService?.perform(withItems: items)
//        } catch {
//            print("Failed to create file")
//            print("\(error)")
//        }
//    }
    
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
