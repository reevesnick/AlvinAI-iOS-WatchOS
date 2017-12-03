//
//  ViewController.swift
//  AlvinAI
//
//  Created by Neegbeah Reeves on 12/31/16.
//  Copyright © 2016 Neegbeah Reeves. All rights reserved.
//

import UIKit
import ChameleonFramework


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let colors:[UIColor] = [
            HexColor("EE6C00")!,UIColor.flatWhite]
        view.backgroundColor = UIColor(hexString:"EE6C00")



        
    }
    // Hide Navigation Bar on this view controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // Show Navigation Bar on other controllers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

