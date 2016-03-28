//
//  ViewController.swift
//  HearthstoneCards
//
//  Created by Tiago Mota on 24/03/16.
//  Copyright © 2016 tiagomota.eu. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    let disposableBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NetworkManager.search("ysera")
            .debug("request")
            .subscribe { (event) -> Void in
                switch event {
                case .Next(let response):
                    // do something with the data
                    print("Response YEY, status code -> \(response.statusCode)")
                    response.statusCode
                    break
                case .Error(let error):
                    // handle the error
                    print("Error!")
                    break
                default:
                    break
                }
        }.addDisposableTo(disposableBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

