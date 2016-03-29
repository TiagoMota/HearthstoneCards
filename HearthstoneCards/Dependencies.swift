//
//  Dependencies.swift
//  HearthstoneCards
//
//  Created by Tiago Mota on 29/03/16.
//  Copyright © 2016 tiagomota.eu. All rights reserved.
//

import Foundation
import RxSwift

class Dependencies {

	static let sharedDependencies = Dependencies() // Singleton

	let URLSession = NSURLSession.sharedSession()
	let backgroundWorkScheduler: ImmediateSchedulerType
	let mainScheduler: SerialDispatchQueueScheduler

	private init() {

		let operationQueue = NSOperationQueue()
		operationQueue.maxConcurrentOperationCount = 2
		operationQueue.qualityOfService = NSQualityOfService.UserInitiated
		backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)

		mainScheduler = MainScheduler.instance
	}
}
