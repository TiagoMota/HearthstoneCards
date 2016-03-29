import Foundation
import ObjectMapper

struct Card: Mappable {
	var cardId: String!
	var name: String!
	var locale: String!
	var cardSet: String!
	var type: String?
	var faction: String?
	var rarity: String?
	var cost: Int?
	var attack: Int?
	var health: Int?
	var text: String?
	var flavor: String?
	var artist: String?
	var collectible: Bool?
	var elite: Bool?
	var race: String?
	var img: String?
	var imgGold: String?
	var mechanics: [Mechanic]?
	var howToGet: String?
	var howToGetGold: String?

	// MARK: JSON
	init?(_ map: Map) { }

	mutating func mapping(map: Map) {
		cardId <- map["cardId"]
		name <- map["name"]
		locale <- map["locale"]
		cardSet <- map["cardSet"]
		type <- map["type"]
		faction <- map["faction"]
		rarity <- map["rarity"]
		cost <- map["cost"]
		attack <- map["attack"]
		health <- map["health"]
		text <- map["text"]
		flavor <- map["flavor"]
		artist <- map["artist"]
		collectible <- map["collectible"]
		elite <- map["elite"]
		race <- map["race"]
		img <- map["img"]
		imgGold <- map["imgGold"]
		mechanics <- map["mechanics"]
		howToGet <- map["howToGet"]
		howToGetGold <- map["howToGetGold"]
	}

	func getImgUrl() -> NSURL? {
		if img != nil {
			let imgUrl = img!.stringByReplacingOccurrencesOfString("http://", withString: "https://")
			return NSURL(string: imgUrl)
		} else {
			return nil
		}
	}

	func getImgGoldUrl() -> NSURL? {
		if img != nil {
			let imgUrl = imgGold!.stringByReplacingOccurrencesOfString("http://", withString: "https://")
			return NSURL(string: imgUrl)
		} else {
			return nil
		}
	}
}