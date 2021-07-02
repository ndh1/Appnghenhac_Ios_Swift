//
//  ViewController.swift
//  Appnghenhac
//
//  Created by Nguyen Dinh Huong on 10/29/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        UIView.transition(with: imgLogo, duration: 0.5, options: UIView.AnimationOptions.transitionFlipFromBottom, animations: { 
        }) { (true) in
            let scr = self.storyboard?.instantiateViewController(identifier: "main")
            self.present(scr!, animated: true, completion: nil)
        }
    }
}

