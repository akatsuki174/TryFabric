//
//  ViewController.swift
//  TryFabric
//
//  Created by akatsuki174 on 2017/04/29.
//  Copyright © 2017年 akatsuki174. All rights reserved.
//

import UIKit
import Optimizely

// Creates a Live Variable with a given key and default value
// that will be accessable throughout your target
internal var messageKey = OptimizelyVariableKey.optimizelyKey(withKey: "message", defaultNSString: "Hello World!")

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let messageButton = UIButton(type: .system)
        messageButton.setTitle("Show Message", for: [])
        messageButton.addTarget(self, action: #selector(self.showMessage(_:)), for: .touchUpInside)
        messageButton.frame = CGRect(x: 25, y: 60, width: 200, height: 50)
        view.addSubview(messageButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage(_ sender: Any) {
        let alert = UIAlertController(title: "Live Variable",
                                      message: Optimizely.string(for: messageKey),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true) {}
    }
    
}

