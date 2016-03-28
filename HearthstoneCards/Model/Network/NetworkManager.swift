import RxSwift
import Moya
import Moya_ObjectMapper

class NetworkManager {

    static var provider : RxMoyaProvider<HearthstoneService> {
        let endpointClosure = { (target: HearthstoneService) -> Endpoint<HearthstoneService> in
            let endpoint: Endpoint<HearthstoneService> = Endpoint<HearthstoneService>(URL: url(target), sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
            
            return endpoint.endpointByAddingHTTPHeaderFields(["X-Mashape-Key": "jMfct3ci2mmshpWfsyZDxvFMwR2hp1CqjofjsnViVYR7pQJ3bB"])
        }

        return RxMoyaProvider<HearthstoneService>(endpointClosure: endpointClosure)
    }


	static func search(term: String) -> Observable<Response> {
		return provider.request(.SearchFor(term: term))
	}

	static func getCardsByName(name: String) -> Observable<[Card]> {
        return provider.request(.GetCardsByName(name: name)).mapArray(Card)
	}

	static func getCardsByType(type: String) -> Observable<[Card]> {
        return provider.request(.GetCardsByType(type: type)).mapArray(Card)
	}

	static func getCardsByRarity(rarity: String) -> Observable<[Card]> {
        return provider.request(.GetCardsByRarity(rarity: rarity)).mapArray(Card)
	}

	static func getCardsByClass(clazz: String) -> Observable<[Card]> {
        return provider.request(.GetCardsByClass(clazz: clazz)).mapArray(Card)
	}
}