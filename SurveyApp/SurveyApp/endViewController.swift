//
//  endViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        if (txtPassword.text == "Password1") {
            self.performSegue(withIdentifier: "end-stats", sender: self);
        } else {
            // Invalid input
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
