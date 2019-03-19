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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
