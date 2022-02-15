//
//  ApiManager.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

 /** This class is used to call apis*/
class ApiManager: NSObject {  
    private lazy var sessionManager: URLSession  = {
        return  LUrlSession().sessionManager
    }()
    
    override init() {
        super.init()
    }

    /** getFeed : Get feed from remote
        * offset            : how much data caller needs.
        * completionBlock   : completionBlock which will contain errorObj and json.
     */
    func getDataForPage(_ page : Int , completionBlock : @escaping Constant.CompletionBlock) {
        makeTask(request:  makeRequest(url: Constant.Api.kEndPoint + "&page=" + String(page), methodType: Constant.Api.kGetRequest), model: Movies.self) { (json, error) in
            completionBlock(json, error)
        }
    }
    
    /** makeRequest         : makeRequest for an api.
           * url            : api url.
           * completionBlock: completionBlock which will contain errorObj and json.
     */
    private func makeRequest(url : String, methodType : String) -> URLRequest {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = methodType
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }

    /** makeTask      : makeTask for an api.
        * url            : api url.
        * completionBlock: completionBlock which will contain errorObj and json.
     */
    private func makeTask<T>(request : URLRequest, model : T.Type , onCompletion : @escaping Constant.CompletionBlock) where T : Codable {
        sessionManager.dataTask(with: request) { (data, response, error) in
            guard let data  = data , error == nil else{
                onCompletion(nil, self.prepareError(error: error))
                return
            }
            let obj =  data.jsonObject(ofType: model)
            onCompletion(obj, self.prepareErrorWithMessage())
        }.resume()
    }

    /** prepareError      : Prepare error.
        * error           : an error object to intialize SCError object.
     */
    private func prepareError(error : Error?) -> LError{
        return LError(error: error)
    }

    /** prepareErrorWithMessage : Prepare error with proper message.
            * errorMessage      : An instance of string. It will be used to show an popup on the screen.
     */
    func prepareErrorWithMessage(_ errorMessage : String? = nil) -> LError {
        return LError(errorMessage: errorMessage)
    }
}
