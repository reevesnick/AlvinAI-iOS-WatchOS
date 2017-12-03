//
//  VoiceSummonViewController.swift
//  AlvinAI
//
//  Created by Neegbeah Reeves on 1/9/17.
//  Copyright © 2017 Neegbeah Reeves. All rights reserved.
//

import UIKit
import AVFoundation
import ChameleonFramework
import ApiAI

extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
}

class VoiceSummonViewController: UIViewController {
    
//    let speechtoTextVar: UILabel!
    
    @IBOutlet weak var textView: UILabel!
    
    @IBOutlet weak var requestLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let colors:[UIColor] = [
            HexColor("EE6C00")!,UIColor.flatWhite]
        view.backgroundColor = UIColor(hexString:"EE6C00")
        
        
        
        
        
        let defaultUtterance = AVSpeechUtterance(string: "Alvin Here! What do you got?")
        defaultUtterance.rate = 0.5
        synth.speak(defaultUtterance)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func permissionCheckMicrophone(){
//
//        private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))
//
//        speechRecognizer.delegate = self  //3
//
//        SFSpeechRecognizer.requestAuthorization { (authStatus) in  //4
//
//            var isButtonEnabled = false
//
//            switch authStatus {  //5
//            case .authorized:
//                isButtonEnabled = true
//
//            case .denied:
//                isButtonEnabled = false
//                print("User denied access to speech recognition")
//
//            case .restricted:
//                isButtonEnabled = false
//                print("Speech recognition restricted on this device")
//
//            case .notDetermined:
//                isButtonEnabled = false
//                print("Speech recognition not yet authorized")
//            }
//
//            OperationQueue.main.addOperation() {
//                self.microphoneButton.isEnabled = isButtonEnabled
//            }
//        }
    }
    
    //Device speak
    func speak(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        synth.speak(speechUtterance)
    }
    
    func dictateText(text: String){
        
    }

    func getResponseAPIParameters(){
        
        let request = ApiAI.shared().textRequest()

        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse

        }, failure: { (request, error) in
            // TODO: handle error
        })
    }
    
    func speechToTextRequest(){
        
    }
    
    
    @IBAction func micButtonAction(sender: AnyObject){
        NSLog("Mic Button Pressed");
        
        // Check if dictation has responded otherwise fall back to break
        
        let request = ApiAI.shared().textRequest()

        request?.query = ["Who are you"]
        request?.setCompletionBlockSuccess({[unowned self]( request, response) -> Void in
            
            // Handle success ...
            self.responseLabel.text = ""
            self.speak(text: "Success Response Recievd")
            
            },failure: {(request,error) -> Void in
            // Handle error ...
                self.responseLabel.text = "Hmmm? I'm not hearing you. Can you please try again in another time"
                self.speak(text: "Hmmm? I'm not hearing you. Can you please try again in another time")
                } )

        ApiAI.shared().enqueue(request)

        
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
