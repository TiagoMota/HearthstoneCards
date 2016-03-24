import Alamofire
import AlamofireObjectMapper

protocol Request<T> {

	func run()

	func method() -> Method
	
	func url() -> String

	func onSuccess(data: T)

	func onError(error: NSError)
}

extension Request<T> {

	func run() {
		Alamofire.request(method(), url()).responseObject { (response: Response<T, NSError>) -> Void in
			if let error = response.result.error as NSError {
				onError(error)
			} else if let data = response.response.value as T{
				onSuccess(data)
			}
		}
	}
	
}
