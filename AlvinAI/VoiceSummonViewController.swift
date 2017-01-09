//
//  VoiceSummonViewController.swift
//  AlvinAI
//
//  Created by Neegbeah Reeves on 1/9/17.
//  Copyright © 2017 Neegbeah Reeves. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceSummonViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textToSpeech(sender: AnyObject){
        myUtterance = AVSpeechUtterance(string: (textView?.text)!)
        myUtterance.rate = 0.3
        synth.speak(myUtterance)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
