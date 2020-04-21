//
//  NavigationController.swift
//  BehindTheName
//
//  Created by Victor Perdomo on 21/04/2020.
//  Copyright © 2020 Victor Perdomo. All rights reserved.
//

import UIKit

class AuthKeyNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        navigationController?.delegate = self
        interactivePopGestureRecognizer?.delegate = self
        
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        
        let navbarAttrs: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                          NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)]
        UINavigationBar.appearance().titleTextAttributes = navbarAttrs
        
//        TODO: Miss
//        let image = UIImage(named: "backArrow")
//        navigationBar.backIndicatorImage = image
//        navigationBar.backIndicatorTransitionMaskImage = image
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // This is to remove the divider from the navigationBar
        navigationBar.shadowImage = UIImage()
    }
    
}

