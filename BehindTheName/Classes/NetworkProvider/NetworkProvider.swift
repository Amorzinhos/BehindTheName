//
//  NetworkProvider.swift
//  BehindTheName
//
//  Created by Victor Perdomo on 21/04/2020.
//  Copyright © 2020 Victor Perdomo. All rights reserved.
//

import Alamofire

public struct DataResponse {
    public let data: Data
    public let response: URLResponse?
}

public typealias HTTPResponse = Result<DataResponse>

class NetworkProvider {
    
    enum Error: Swift.Error {
        case noDataReceived
    }
    
    static let instance = NetworkProvider()
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        let instance = SessionManager(configuration: configuration)
        return instance
    }()

    init() {}
    
    func request(_ baseUrl: String, path: String?, method: HTTPMethod, parameters: [String: Any]? = nil, encoding: ParameterEncoding?, headers: [String: String]? = nil, completionHandler: @escaping (HTTPResponse) -> Void) {
        do {
            let url = try self.validate(url: baseUrl, path: path)
            let acceptableStatusCodes: Range<Int> = 200 ..< 300

            sessionManager.request(url, method: method, parameters: parameters, encoding: encoding ?? JSONEncoding.default, headers: headers)
                .validate(statusCode: acceptableStatusCodes)
                .response { response in
                    if let error = response.error {
                        completionHandler(.failure(error))
                        return
                    }
                    guard let data = response.data else {
                        completionHandler(.failure(Error.noDataReceived))
                        return
                    }
                    completionHandler(.success(DataResponse(data: data, response: response.response)))
                }
        } catch {
            completionHandler(.failure(error))
            return
        }
    }
        
    enum RequestSpecError: Swift.Error {
        case invalidURL
    }
    
    private func validate(url: String, path: String?) throws -> URL {
        guard var url = URL(string: url) else { throw RequestSpecError.invalidURL }
        
        if let path = path {
            url.appendPathComponent(path)
        }
        return url
    }
    
}
