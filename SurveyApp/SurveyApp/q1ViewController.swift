//
//  q1ViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit

class q1ViewController: UIViewController {
    
    var data:dataStruct?
    var segueString:String = "";
    // Adanced feature
    let refreshAlert = UIAlertController(title: "Confirm", message: "Are you happy with your answer?", preferredStyle: UIAlertController.Style.alert)
    
    @IBAction func btnClick(_ sender: UIButton) {
        
        // Depending on which button the user enters, it will perform different segues
        switch sender.tag {
            case 0:
                data?.q1=false;
                segueString = "q1-q2b";
            case 1:
                data?.q1=true;
                segueString = "q1-q2a";
            default: print("no selection")
        }
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: self.segueString, sender: self)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel))
    }
    
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        switch segueString {
            case "q1-q2a":
                guard let destination = segue.destination as? q2aViewController else {return};
                destination.data = self.data;
            case "q1-q2b":
                guard let destination = segue.destination as? q2bViewController else {return};
                destination.data = self.data;
            default: print("error")
        }
    }

}
