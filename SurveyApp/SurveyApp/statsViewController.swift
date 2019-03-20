//
//  statsViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit
import CoreData

class statsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var dataArr : [String] = [];
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = getData()
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

}
