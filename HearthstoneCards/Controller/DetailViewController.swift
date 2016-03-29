//
//  ViewController.swift
//  HearthstoneCards
//
//  Created by Tiago Mota on 24/03/16.
//  Copyright © 2016 tiagomota.eu. All rights reserved.
//

import UIKit
import RxSwift
import Nuke

class DetailViewController: BaseViewController {

	@IBOutlet weak var imgView: UIImageView!

	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var attackLbl: UILabel!
	@IBOutlet weak var healthLbl: UILabel!
	@IBOutlet weak var rarityLbl: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		NetworkManager.instance.getCardsByName("Alexstrasza")
			.subscribe { (event) -> Void in
				switch event {
				case .Next(let cards):
					// do something with the data
					self.configureDetail(cards[0])
					break
				case .Error(let error):
					// handle the error
					print("Error! -> \(error)")
					break
				default:
					print("Default!")
					break
				}
		}.addDisposableTo(disposableBag)
	}

	private func configureDetail(card: Card) {
		let request = ImageRequest(URL: card.getImgUrl()!)
		imgView.nk_setImageWith(request)

		attackLbl.text = "\(card.attack!)"
		healthLbl.text = "\(card.health!)"
		rarityLbl.text = "\(card.rarity!)"
	}
}
