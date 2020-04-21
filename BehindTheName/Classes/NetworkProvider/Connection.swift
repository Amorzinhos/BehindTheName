//
//  Connection.swift
//  BehindTheName
//
//  Created by Victor Perdomo on 21/04/2020.
//  Copyright © 2020 Victor Perdomo. All rights reserved.
//

import Alamofire

public class ServiceConnection: NSObject {
    public class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
}
