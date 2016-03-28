import Foundation
import Moya

enum HearthstoneService {
	case SearchFor(term: String)
	case GetCardsByClass(class: String)
	case GetCardsByRarity(rarity: String)
	case GetCardsByType(type: String)
	case GetCardsByName(name: String)
}

// MARK: - Helpers
private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
 
    var UTF8EncodedData: NSData {
        return self.dataUsingEncoding(NSUTF8StringEncoding)!
    }
}

// MARK: - provides way to read sample data from external file for testing
extension HearthstoneService {
	private func readDataFile(path: String) -> NSData {
		let location = NSString(string: path).stringByExpandingTildeInPath

		do {
			let fileContent = try NSString(contentsOfFile: location, encoding: NSUTF8StringEncoding)
		} catch err as NSError {
			debugPrint("Failed opening data file for sample data.")
		}
	}
}


extension HearthstoneService : TargetType {
	
	var baseURL: NSURL { return NSURL(string: Constants.BaseURL! }
    
    var path: String {
        switch self {
        	case .SearchFor(let term):
            	return "cards/search/\(term)"
	        case .GetCardsByClass(let class):
	            return "cards/classes/\(class)"
	        case .GetCardsByRarity(let rarity):
	            return "cards/qualities/\(rarity)"
	        case .GetCardsByType(let type):
	            return "cards/types/\(type)"
	        case .GetCardsByName(let name):
	        	return "cards/\(name)"
        }
    }
    
    var method: Moya.Method {
        switch self {
	        case .SearchFor, .GetCardsByClass, .GetCardsByRarity, .GetCardsByType, .GetCardsByName:
	            return .GET
        }
    }
    
    var parameters: [String: AnyObject]? {
        switch self {
	        case .SearchFor, .GetCardsByClass, .GetCardsByRarity, .GetCardsByType, .GetCardsByName:
	        	return nil
        }
    }
    
    var sampleData: NSData {
        switch self {
        	case .SearchFor(let term):
            	return readDataFile("~/SampleData/SearchFor.json").UTF8EncodedData
	        case .GetCardsByClass(let class):
	            return readDataFile("~/SampleData/GetCardsByClass.json").UTF8EncodedData
	        case .GetCardsByRarity(let rarity):
	            return readDataFile("~/SampleData/GetCardsByRarity.json").UTF8EncodedData
	        case .GetCardsByType(let type):
	            return readDataFile("~/SampleData/GetCardsByType.json").UTF8EncodedData
	        case .GetCardsByName(let name):
	        	return readDataFile("~/SampleData/GetCardsByName.json").UTF8EncodedData
        }
    }
}
