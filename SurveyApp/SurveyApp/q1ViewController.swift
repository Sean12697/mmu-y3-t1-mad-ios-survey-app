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
    
    @IBAction func btnClick(_ sender: UIButton) {
        
        switch sender.tag {
            case 0:
                data?.q1=false;
                segueString = "q1-q2b";
            case 1:
                data?.q1=true;
                segueString = "q1-q2a";
            default: print("no selection")
        }
        
        self.performSegue(withIdentifier: segueString, sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
