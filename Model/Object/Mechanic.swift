import ObjectMapper

struct Mechanic : Mappable {
	var name : String

	init?(_ map: Map) {
    }

    mutating func mapping(map: Map) {
    	name <- map["name"]
    }
}