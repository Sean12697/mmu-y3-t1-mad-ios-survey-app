//
//  q2aViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 18/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit

class q2aViewController: UIViewController {

    var data:dataStruct?
    @IBOutlet weak var btnWork: UIButton!
    @IBOutlet weak var btnGaming: UIButton!
    @IBOutlet weak var btnInternet: UIButton!
    @IBOutlet weak var btnSocial: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isEnabled = false;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        btnNext.isEnabled = true;
        switch sender.tag {
        case 0:
            data?.q2a = "Work";
            selectAllExecept(btnWork);
        case 1:
            data?.q2a = "Gaming";
            selectAllExecept(btnGaming);
        case 2:
            data?.q2a = "Internet";
            selectAllExecept(btnInternet);
        case 3:
            data?.q2a = "Social";
            selectAllExecept(btnSocial);
        case 4:
            data?.q2a = "Other";
            selectAllExecept(btnOther);
        default: print("Selection Error")
        }
    }
    
    func selectAllExecept(_ execept: UIButton) {
        btnWork.isSelected = false;
        btnGaming.isSelected = false;
        btnInternet.isSelected = false;
        btnSocial.isSelected = false;
        btnOther.isSelected = false;
        execept.isSelected = true;
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        // Stuff
        self.performSegue(withIdentifier: "q2a-q3", sender: self)
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        guard let destination = segue.destination as? q3ViewController else {return}
        destination.data = self.data;
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
