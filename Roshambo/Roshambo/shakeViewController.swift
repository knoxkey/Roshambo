//
//  shakeViewController.swift
//  Roshambo
//
//  Created by KNOX KEY on 2/25/16.
//  Copyright © 2016 Wingwood. All rights reserved.
//

import UIKit

class shakeViewController: UIViewController {

    var labelArray = [0]
    var resultArray = [0]
    var paperFlag: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        paperFlag = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        //Rock does not use this code, so..
        //If my shake was not paper, then default to Scissors
        if paperFlag != true {
            resultArray = [1,3,0]
            labelArray = [2,1,0]
        }

        let controller = segue.destinationViewController as! resultViewController

        let machineShake = self.randomShake()
        controller.valueIndex = resultArray[machineShake]
        controller.labelIndex = labelArray[machineShake]
    }

    //Generate a random number to define machine's shake
    func randomShake() -> Int {
        let randomIndex = arc4random() % 3
        return Int(randomIndex)
    }

    @IBAction func shakeRock() {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("resultViewController") as! resultViewController

        let machineShake = self.randomShake()
        controller.valueIndex = [0,2,1][machineShake]
        controller.labelIndex = [0,2,1][machineShake]

        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func shakePaper() {
        //set Paper flag for segue prep
        paperFlag = true

        resultArray = [2,0,3]
        labelArray = [1,0,2]

        performSegueWithIdentifier("shakeFingers", sender: self)
    }
}

