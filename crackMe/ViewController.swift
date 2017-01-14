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
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelThird: UILabel!
    @IBOutlet weak var labelFourth: UILabel!
    var labels: [UILabel] = [UILabel]()
    var iter = 0
    
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
    
    @IBOutlet weak var ResultsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.labels = [self.labelFirst, self.labelSecond, self.labelThird, self.labelFourth]
        self.iter = 0
        self.buttons = [self.button0, self.button1, self.button2, self.button3, self.button4, self.button5, self.button6, self.button7, self.button8, self.button9]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickNumberButton(_ button: UIButton) {
        self.labels[iter].text! = button.titleLabel!.text!
        self.iter += 1
    }
    
    @IBAction func removeButton(_ sender: UIButton) {
        self.iter -= 1
        self.labels[self.iter].text! = ""
    }
    
    func turnFinish() {
        
    }
    
    var results = ["1", "2", "3", "4", "5"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ResultsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResultTableViewCell
        
        cell.labelFirst.text = results[indexPath.row]
        cell.labelSecond.text = results[indexPath.row]
        cell.labelThird.text = results[indexPath.row]
        cell.labelFourth.text = results[indexPath.row]
        
        cell.rightNumbers.text = results[indexPath.row]
        cell.weakNumbers.text = results[indexPath.row]
        return cell
    }
}



