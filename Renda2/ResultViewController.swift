//
//  ResultViewController.swift
//  Renda2
//
//  Created by 堀弘昌 on 2022/08/29.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var speedLabel: UILabel!
    
    var countResult: Int = 0
    
    @IBOutlet var resultLabel2: UILabel!
    
    @IBOutlet var speedLabel2: UILabel!
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var backButton: UIButton!
    
    var countResult2: Int = 0
    
    var p1name: String = ""
    var p2name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = p1name + ": \(countResult)tap"
        
        speedLabel.text = "\(Float(countResult)/10) tap/s"
        
        resultLabel2.text = p2name + ": \(countResult2)tap"
        
        speedLabel2.text = "\(Float(countResult2)/10) tap/s"
        
        if countResult > countResult2 {
            winnerLabel.text = p1name + " Win!"
            resultLabel.font = resultLabel.font.withSize(50)
            speedLabel.font = speedLabel.font.withSize(50)
        }
        else if countResult < countResult2 {
            winnerLabel.text = p2name + " Win!"
            resultLabel2.font = resultLabel2.font.withSize(50)
            speedLabel.font = speedLabel.font.withSize(50)
        }
        else {
            winnerLabel.text = "Draw"
        }

        // Do any additional setup after loading the view.
        backButton.layer.cornerRadius = 30
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
