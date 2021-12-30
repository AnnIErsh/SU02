//
// ArticlesAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class ArticlesAPI {

    /**
     News List
     
     - parameter q: (query) Theme of news 
     - parameter from: (query) date 
     - parameter sortBy: (query) Sort 
     - parameter language: (query) Language in two letters 
     - parameter apiKey: (query) API key 
     - parameter page: (query) number of page (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func everythingGet(q: String, from: String, sortBy: String, language: String, apiKey: String, page: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)) -> RequestTask {
        return everythingGetWithRequestBuilder(q: q, from: from, sortBy: sortBy, language: language, apiKey: apiKey, page: page).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     News List
     - GET /everything/
     - parameter q: (query) Theme of news 
     - parameter from: (query) date 
     - parameter sortBy: (query) Sort 
     - parameter language: (query) Language in two letters 
     - parameter apiKey: (query) API key 
     - parameter page: (query) number of page (optional)
     - returns: RequestBuilder<ArticleList> 
     */
    open class func everythingGetWithRequestBuilder(q: String, from: String, sortBy: String, language: String, apiKey: String, page: Int? = nil) -> RequestBuilder<ArticleList> {
        let localVariablePath = "/everything/"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "q": q.encodeToJSON(),
            "from": from.encodeToJSON(),
            "sortBy": sortBy.encodeToJSON(),
            "language": language.encodeToJSON(),
            "apiKey": apiKey.encodeToJSON(),
            "page": page?.encodeToJSON(),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ArticleList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}