import RxSwift
import Moya
import Moya_ObjectMapper

class NetworkManager {

	static let instance = NetworkManager()

	let provider: RxMoyaProvider<HearthstoneService>!
	let dependencies: Dependencies!

	private init() {
		let endpointClosure = { (target: HearthstoneService) -> Endpoint<HearthstoneService> in
			let endpoint: Endpoint<HearthstoneService> = Endpoint<HearthstoneService>(URL: url(target), sampleResponseClosure: { .NetworkResponse(200, target.sampleData) }, method: target.method, parameters: target.parameters)

			return endpoint.endpointByAddingHTTPHeaderFields(["X-Mashape-Key": "jMfct3ci2mmshpWfsyZDxvFMwR2hp1CqjofjsnViVYR7pQJ3bB"])
		}

		provider = RxMoyaProvider<HearthstoneService>(endpointClosure: endpointClosure)
		dependencies = Dependencies.sharedDependencies
	}

	func search(term: String) -> Observable<[Card]> {
		return provider.request(.SearchFor(term: term))
			.observeOn(dependencies.backgroundWorkScheduler)
			.mapArray(Card)
			.observeOn(dependencies.mainScheduler)
	}

	func getCardsByName(name: String) -> Observable<[Card]> {
		return provider.request(.GetCardsByName(name: name))
			.observeOn(dependencies.backgroundWorkScheduler)
			.mapArray(Card)
			.observeOn(dependencies.mainScheduler)
	}

	func getCardsByType(type: String) -> Observable<[Card]> {
		return provider.request(.GetCardsByType(type: type))
			.observeOn(dependencies.backgroundWorkScheduler)
			.mapArray(Card)
			.observeOn(dependencies.mainScheduler)
	}

	func getCardsByRarity(rarity: String) -> Observable<[Card]> {
		return provider.request(.GetCardsByRarity(rarity: rarity))
			.observeOn(dependencies.backgroundWorkScheduler)
			.mapArray(Card)
			.observeOn(dependencies.mainScheduler)
	}

	func getCardsByClass(clazz: String) -> Observable<[Card]> {
		return provider.request(.GetCardsByClass(clazz: clazz))
			.observeOn(dependencies.backgroundWorkScheduler)
			.mapArray(Card)
			.observeOn(dependencies.mainScheduler)
	}
}