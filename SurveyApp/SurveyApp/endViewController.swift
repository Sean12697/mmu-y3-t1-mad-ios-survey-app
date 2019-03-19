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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let jsonData = try JSONEncoder().encode([data])
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
        } catch { print(error) }
            
        // Do any additional setup after loading the view.
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
