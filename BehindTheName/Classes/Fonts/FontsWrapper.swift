//
//  FontsWrapper.swift
//  BehindTheName
//
//  Created by Victor Perdomo on 21/04/2020.
//  Copyright © 2020 Victor Perdomo. All rights reserved.
//

import UIKit

public class SantanderFont {
    
    public class func bold(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    public class func semiBold(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    public class func light(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }
    
    public class func regular(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
}
