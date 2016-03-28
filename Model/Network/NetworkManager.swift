import RxSwift
import Moya

class NetworkManager {

	static let provider = RxMoyaProvider<HearthstoneService>() 

	static func search(term: String) -> Observable<[Card]> {
		return provider.request(.SearchFor(term)).mapArray(Card)
	}

	static func getCardsByName(name: String) -> Observable<[Card]> {
		return provider.request(.GetCardsByName(name)).mapArray(Card)
	}

	static func getCardsByType(type: String) -> Observable<[Card]> {
		return provider.request(.GetCardsByType(type)).mapArray(Card)
	}

	static func getCardsByRarity(rarity: String) -> Observable<[Card]> {
		return provider.request(.GetCardsByRarity(rarity)).mapArray(Card)
	}

	static func getCardsByClass(class: String) -> Observable<[Card]> {
		return provider.request(.GetCardsByClass(class)).mapArray(Card)
	}
}