//
//  q3ViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit

class q3ViewController: UIViewController {

    var data:dataStruct?
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    let refreshAlert = UIAlertController(title: "Confirm", message: "Are you happy with your answer?", preferredStyle: UIAlertController.Style.alert)
    
    @IBAction func btnClick(_ sender: UIButton) {
        
        switch sender.tag {
            case 0: data?.q3=false;
            case 1: data?.q3=true;
            default: print("no selection")
        }
        
        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "q3-end", sender: self)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel))
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        guard let destination = segue.destination as? endViewController else {return}
        destination.data = self.data
    }

}
