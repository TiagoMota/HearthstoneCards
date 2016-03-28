import ObjectMapper

struct Mechanic : Mappable {
	var name : String

	// MARK: JSON
  	init?(_ map: Map) { }

    mutating func mapping(map: Map) {
    	name <- map["name"]
    }
}