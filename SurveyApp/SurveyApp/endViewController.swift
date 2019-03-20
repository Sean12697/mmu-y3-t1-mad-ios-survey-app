//
//  endViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit
import CoreData

class endViewController: UIViewController {
    
    var data:dataStruct?
    @IBOutlet weak var txtTest: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let jsonData = try JSONEncoder().encode([data])
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
        } catch { print(error) }
            
        // Do any additional setup after loading the view.
        saveData();
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        if (txtPassword.text == "Password1") {
            self.performSegue(withIdentifier: "end-stats", sender: self);
        } else {
            // Invalid input
        }
    }
    
    func saveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext;
        let userEntity = NSEntityDescription.entity(forEntityName: "Data", in: managedContext);
        let userData = NSManagedObject(entity: userEntity!, insertInto: managedContext);
        
        userData.setValue(data!.id, forKeyPath: "id");
        userData.setValue(data!.q1, forKey: "q1");
        userData.setValue(data!.q2a, forKey: "q2a");
        userData.setValue(data!.q2b, forKey: "q2b");
        userData.setValue(data!.q3, forKey: "q3");
        userData.setValue(data!.lat, forKey: "lat");
        userData.setValue(data!.long, forKey: "long");
        
        do {
            try managedContext.save();
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)");
        }
    }
    
//    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
//        guard let destination = segue.destination as? statsViewController else {return}
//        // destination.data = self.data
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
