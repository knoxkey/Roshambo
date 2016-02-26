//
//  resultViewController.swift
//  Roshambo
//
//  Created by KNOX KEY on 2/25/16.
//  Copyright © 2016 Wingwood. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    var valueIndex: Int?
    var labelIndex: Int?

    let imageNames = ["itsATie","RockCrushesScissors","PaperCoversRock","ScissorsCutPaper"]
    let resultLabels = ["It's a tie.","You win!","You lose."]

    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        //set result image based on index passed from shakeViewController
        if let valueIndex = self.valueIndex {
            self.resultImage.image = UIImage(named: imageNames[valueIndex])
        } else {
            self.resultImage.image = nil
        }

        //set result text based on index passed from shakeViewController
        if let labelIndex = self.labelIndex {
            self.resultLabel.text = resultLabels[labelIndex]
        } else {
            self.resultLabel.text = nil
        }
    }

    //*    dismiss this view controller
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
