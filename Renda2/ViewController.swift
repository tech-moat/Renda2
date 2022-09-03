//
//  ViewController.swift
//  Renda2
//
//  Created by 堀弘昌 on 2022/08/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var countLabel2: UILabel!
    
    @IBOutlet var p1nameLabel: UILabel!
    @IBOutlet var p2nameLabel: UILabel!
    
    @IBOutlet var tapButton: UIButton!
    @IBOutlet var tapButton2: UIButton!
    
    @IBOutlet var timeLabel: UILabel!
    
    var p1name: String!
    var p2name: String!
    
    var timerCount: Float = 10.0
    
    var timer: Timer = Timer()
    
    var count: Int = 0
    var count2: Int = 0
    
    var isEnd: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tapButton.titleLabel?.adjustsFontSizeToFitWidth = false
        tapButton.layer.cornerRadius = 100
        tapButton2.layer.cornerRadius = 100
        tapButton2.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi))
        countLabel2.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi))
        timeLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-CGFloat.pi/2))
        tapButton.backgroundColor = UIColor {_ in return #colorLiteral(red: 0.5600001812, green: 0.8307208419, blue: 0.7753049731, alpha: 1)}
        tapButton2.backgroundColor = UIColor {_ in return #colorLiteral(red: 0.5600001812, green: 0.8307208419, blue: 0.7753049731, alpha: 1)}
        tapButton.setTitle("Start", for: .normal)
        tapButton2.setTitle("Start", for: .normal)
//        tapButton.titleLabel?.font = UIFont(name: "ロンド B スクエア", size: 40)
//        tapButton2.titleLabel?.font = UIFont(name: "System Font Regular", size: 40)
        countLabel.textColor = UIColor {_ in return #colorLiteral(red: 0.1576753259, green: 0.1365649998, blue: 0.2715232372, alpha: 1)}
        countLabel2.textColor = UIColor {_ in return #colorLiteral(red: 0.1576753259, green: 0.1365649998, blue: 0.2715232372, alpha: 1)}
        p2nameLabel.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi))
        p1nameLabel.text = p1name
        p2nameLabel.text = p2name
    }

    @IBAction func tapCount(){
        if isEnd == false {
            count += 1
            
            countLabel.text = String(count)
        }
    }
    
    @IBAction func tapCount2(){
        if isEnd == false {
            count2 += 1
            
            countLabel2.text = String(count2)
        }
    }
    
    @IBAction func start() {
        
        if isEnd == false {
            if !timer.isValid{
                timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
                
                tapButton.setTitle("Tap", for: .normal)
//                tapButton.titleLabel?.font = UIFont(name: "System Font Regular", size: 40)
//                tapButton.backgroundColor = UIColor.red
                tapButton2.setTitle("Tap", for: .normal)
//                tapButton2.titleLabel?.font = UIFont(name: "System Font Regular", size: 40)
//                tapButton2.backgroundColor = UIColor.red
                tapButton.backgroundColor = UIColor {_ in return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)}
                tapButton2.backgroundColor = UIColor {_ in return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)}
            }
        }
    }
    
    func stop(){
        if timer.isValid {
            timer.invalidate()
        }
    }
    
    @objc func up(){
        timerCount -= 0.01
        
        timeLabel.text = String(format: "%.2f", timerCount)
        
        if timerCount < 0.0 {
            stop()
            isEnd = true
            timeLabel.text = "0.00"
            self.performSegue(withIdentifier: "ToResult", sender: self)
        }
        
        if count > count2 {
            countLabel.textColor = UIColor {_ in return #colorLiteral(red: 0.937254902, green: 0.2745098039, blue: 0.1803921569, alpha: 1)}
            countLabel2.textColor = UIColor {_ in return #colorLiteral(red: 0.1576753259, green: 0.1365649998, blue: 0.2715232372, alpha: 1)}
        }
        else if count < count2 {
            countLabel.textColor = UIColor {_ in return #colorLiteral(red: 0.1576753259, green: 0.1365649998, blue: 0.2715232372, alpha: 1)}
            countLabel2.textColor = UIColor {_ in return #colorLiteral(red: 0.937254902, green: 0.2745098039, blue: 0.1803921569, alpha: 1)}
        }
        else {
            countLabel.textColor = UIColor {_ in return #colorLiteral(red: 0.1576753259, green: 0.1365649998, blue: 0.2715232372, alpha: 1)}
            countLabel2.textColor = UIColor {_ in return #colorLiteral(red: 0.1576753259, green: 0.1365649998, blue: 0.2715232372, alpha: 1)}
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToResult" {
                let resultVC = segue.destination as!  ResultViewController
                resultVC.countResult = count
                resultVC.countResult2 = count2
                resultVC.p1name = p1name
                resultVC.p2name = p2name
            }
        }
    
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        timerCount = 10.0
        
        isEnd = false
        
        count = 0
        count2 = 0
        
        countLabel.text = "0"
        countLabel2.text = "0"
        
        viewDidLoad()
    }

}

