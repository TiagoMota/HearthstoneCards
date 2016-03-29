//
//  BaseViewController.swift
//  HearthstoneCards
//
//  Created by Tiago Mota on 29/03/16.
//  Copyright © 2016 tiagomota.eu. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

	// set a disposable bag for observables used in the ViewController
	let disposableBag = DisposeBag()
}
