//
//  ViewController.swift
//  HearthstoneCards
//
//  Created by Tiago Mota on 24/03/16.
//  Copyright © 2016 tiagomota.eu. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

class DetailViewController: BaseViewController {

	@IBOutlet weak var imgView: UIImageView!

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
		let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		let optionInfo: KingfisherOptionsInfo = [
				.ForceRefresh,
				.DownloadPriority(1.0),
				.CallbackDispatchQueue(queue),
				.Transition(ImageTransition.Fade(1))
		]
		imgView.kf_setImageWithURL(card.getImgUrl()!,
			placeholderImage: UIImage(named: "card_back"),
			optionsInfo: optionInfo,
			progressBlock: { (receivedSize, totalSize) -> () in
				print("Download Progress: \(receivedSize)/\(totalSize)")
			},
			completionHandler: { (image, error, cacheType, imageURL) -> () in
				print("Downloaded and set!")
			}
		)
	}
}
