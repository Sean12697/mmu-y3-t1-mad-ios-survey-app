//
//  startViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit

class startViewController: UIViewController {

    var data:dataStruct? = dataStruct();
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
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
        
    }
    
    @IBAction func statsClick(_ sender: Any) {
        self.performSegue(withIdentifier: "start-stats", sender: self)
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
