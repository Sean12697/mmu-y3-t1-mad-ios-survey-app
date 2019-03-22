//
//  startViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit

class startViewController: UIViewController {

    var data:dataStruct? = dataStruct(); // Iniating the values so not nil
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    // Only for verified users : Password1
    let alert = UIAlertController(title: "Access Results", message: "Please enter the super secure password: ", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.addTextField { (textField) in
            textField.text = "password" // Placeholder text
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            if (textField.text == "Password1") { // Go to stats screen if users types correct password
                self.performSegue(withIdentifier: "start-stats", sender: self);
            }
        }))
    }
    
    // Setting the data to be sent to the next screen via the segue
    @IBAction func btnNext(_ sender: UIButton) {
        data?.id = txtID.text;
        data?.dob = date.date;
        self.performSegue(withIdentifier: "start-q1", sender: self)
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        guard let destination = segue.destination as? q1ViewController else {return}
        destination.data = self.data;
    }
    
    @IBAction func rewind(unwindSegue: UIStoryboardSegue) {
        // Needed to know which segue to go back to upon completion
    }
    
    @IBAction func statsClick(_ sender: Any) {
        self.present(alert, animated: true, completion: nil)
    }

}
