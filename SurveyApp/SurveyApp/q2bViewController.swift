//
//  q2bViewController.swift
//  SurveyApp
//
//  Created by Sean O'mahoney on 19/03/2019.
//  Copyright © 2019 Yap Moi Hoon. All rights reserved.
//

import UIKit

class q2bViewController: UIViewController {

    var data:dataStruct?
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var btnNext: UIButton!
    let refreshAlert = UIAlertController(title: "Confirm", message: "Are you happy with your answer?", preferredStyle: UIAlertController.Style.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            self.performSegue(withIdentifier: "q2b-q3", sender: self)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel))
    }
    
    // Snaps to the nearest value
    @IBAction func sliderChange(_ sender: UISlider) {
        sender.setValue(sender.value.rounded(), animated: false)
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        data?.q2b = Int(slider.value);
        present(refreshAlert, animated: true, completion: nil)
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        guard let destination = segue.destination as? q3ViewController else {return}
        destination.data = self.data;
    }

}
