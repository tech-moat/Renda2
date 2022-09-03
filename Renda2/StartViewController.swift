//
//  StartViewController.swift
//  Renda2
//
//  Created by 堀弘昌 on 2022/09/03.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var p1nameTextField: UITextField!
    @IBOutlet var p2nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 30
    }
    
//    @IBAction func pushStartButton() {
//        let p1name: String = p1nameTextField.text!
//        let p2name: String = p2nameTextField.text!
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToMain" {
                let mainVC = segue.destination as!  ViewController
                mainVC.p1name = p1nameTextField.text!
                mainVC.p2name = p2nameTextField.text!
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
