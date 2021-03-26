import UIKit
/*
 Enum uses in API
 https://www.swiftbysundell.com/posts/the-power-of-result-types-in-swift
 */
enum Result<Value: Decodable> {
    case success(Value)
    case failure(Bool)
}

typealias Handler = (Result<Data>) -> Void

enum NetworkError: Error {
    case nullData
}


public enum Method {
    case delete
    case get
    case head
    case post
    case put
    case connect
    case options
    case trace
    case patch
    case other(method: String)
}

enum NetworkingError: String, LocalizedError {
    case jsonError = "JSON error"
    case other
    var localizedDescription: String { return NSLocalizedString(self.rawValue, comment: "") }
}

extension Method {
    public init(_ rawValue: String) {
        let method = rawValue.uppercased()
        switch method {
        case "DELETE":
            self = .delete
        case "GET":
            self = .get
        case "HEAD":
            self = .head
        case "POST":
            self = .post
        case "PUT":
            self = .put
        case "CONNECT":
            self = .connect
        case "OPTIONS":
            self = .options
        case "TRACE":
            self = .trace
        case "PATCH":
            self = .patch
        default:
            self = .other(method: method)
        }
    }
}

extension Method: CustomStringConvertible {
    public var description: String {
        switch self {
        case .delete:            return "DELETE"
        case .get:               return "GET"
        case .head:              return "HEAD"
        case .post:              return "POST"
        case .put:               return "PUT"
        case .connect:           return "CONNECT"
        case .options:           return "OPTIONS"
        case .trace:             return "TRACE"
        case .patch:             return "PATCH"
        case .other(let method): return method.uppercased()
        }
    }
}

protocol Requestable {}

extension Requestable {
    internal func getRequest(url: String, callback: @escaping (_ json: NSDictionary?) -> ()) {
        do {
            try request(method: .get, url: url, params: nil) { (dict) in
                //callback(dict)
            }
        } catch {
            callback(nil)
        }
    }
    
    internal func request(method: Method, url: String, params: [NSString: Any]? = nil, callback: @escaping Handler) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        // var request = URLRequest(url: url)
        
        // let deviceID = "12334"
        //request.setValue(deviceID, forHTTPHeaderField: "Device-ID")
        // if let params = params {
        /*  request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
         request.setValue("super secret password", forHTTPHeaderField: "Authorization")
         request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted) */
        
        // Http method
        //common headers
        // request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        //  request.setValue(ContentType.ENUS.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptLangauge.rawValue)
        // }
        
        print(url)
        //http://5f5a8f24d44d640016169133.mockapi.io/api/events
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if error == nil {
                do {
                    //let myStructDictionary = try JSONDecoder().decode([ListaEventos].self, from: data!)
                    //myStructDictionary.forEach { print($0.title!) }
                    
                    callback(.success(data!))
                } catch {
                    print(error)
                    return
                }
            }
        }
        task.resume()
        
        
        
        
    }
}