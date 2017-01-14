//
//  ViewController.swift
//  crackMe
//
//  Created by Vlad Kampov on 1/10/17.
//  Copyright © 2017 Vlad Kampov. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var successArray = Array<Int>()
    
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThird: UILabel!
    @IBOutlet weak var labelFourth: UILabel!
    var labels: [UILabel] = [UILabel]()
    var iter = 0
    var countOfTurns = 0
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button0: UIButton!
    var buttons: [UIButton] = [UIButton]()
    
    @IBOutlet weak var tableView: UITableView!
    var results = Array<Array<Int>>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.labels = [self.labelFirst, self.labelSecond, self.labelThird, self.labelFourth]
        self.iter = 0
        self.buttons = [self.button0, self.button1, self.button2, self.button3, self.button4, self.button5, self.button6, self.button7, self.button8, self.button9]
        
        while (self.successArray.count != 4) {
            let randomNumber = Int(arc4random_uniform(10))
            if (!self.successArray.contains(randomNumber)) {
                self.successArray.append(randomNumber)
            }
        }
        print(self.successArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickNumberButton(_ button: UIButton) {
        self.labels[iter].text! = button.titleLabel!.text!
        if (self.iter < self.labels.count - 1) {
            self.iter += 1
        } else {
            turnFinish()
        }
    }
    
    @IBAction func removeButton(_ sender: UIButton) {
        self.iter -= 1
        self.labels[self.iter].text! = ""
    }
    
    func turnFinish() {
        var tmp = Array<Int>()
        for i in 0...self.labels.count - 1 {
            tmp.append(Int(self.labels[i].text!)!)
        }
        
        for i in 0...self.labels.count - 1 {
            self.labels[i].text! = ""
        }
        self.results.insert(tmp, at: 0)
        self.iter = 0
        self.countOfTurns += 1
        self.tableView.reloadData()
    }
    
    func endOfTheGame() {
        self.results = []
        self.iter = 0
        self.countOfTurns = 0
        
        for el in self.labels {
            print(el)
        }
        
        return
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultTableViewCell
        
        var currentResult = results[indexPath.row]
        cell.labelFirst.text = String(currentResult[0])
        cell.labelSecond.text = String(currentResult[1])
        cell.labelThird.text = String(currentResult[2])
        cell.labelFourth.text = String(currentResult[3])
        
        var rightNumbers = 0
        var weakNumbers = 0
        for i in 0...currentResult.count - 1 {
            if currentResult[i] == successArray[i]{
                rightNumbers += 1
            } else if successArray.contains(currentResult[i]) {
                weakNumbers += 1
            }
        }
        
        cell.rightNumbers.text = String(rightNumbers)
        cell.weakNumbers.text = String(weakNumbers)
        return cell
    }
}



