//
//  Router.swift
//  Warmshowers
//
//  Created by Michael Haeuslmann on 23/05/15.
//  Copyright (c) 2015 Michael Haeuslmann. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible
{
    static let baseURLString = "https://www.warmshowers.org"
    
    case Login(username: String, password: String)
    case Logout(username: String, password: String)
    case ReadUser(userId: Int)
    
    var path: String {
        switch self {
            case .Login:
                return "/services/rest/user/login"
            case .Logout:
                return "/services/rest/user/logout"
            case .ReadUser(let userId):
                return "/services/rest/user/\(userId)"
        }
    }
        
    var method: Alamofire.Method {
        switch self {
            case .Login:
                return .POST
            case .Logout:
                return .POST
            case .ReadUser:
                return .GET
        }
    }
        
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        let URL = NSURL(string: Router.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        switch self {
            case .Login(let username, let password):
                return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: [
                        "username": username,
                        "password": password
                    ]).0
            case .Logout(let username, let password):
                return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: [
                    "username": username,
                    "password": password
                    ]).0
            case .ReadUser(let userId):
                return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: nil).0
            default:
                return mutableURLRequest
        }
    }
}