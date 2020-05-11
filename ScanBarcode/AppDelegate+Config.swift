//
//  AppDelegate+Config.swift
//  ScanBarcode
//
//  Created by Nguyen Trung Hieu on 5/11/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension AppDelegate {
    
    func configLibrary() {
        
    }
    
    
    func loadDefaultViewController() {
        let scannerViewController = ScannerViewController.loadFromNib()
        window?.rootViewController = scannerViewController
        
    }

}

extension UIViewController {
    class func loadFromNib() -> Self {
        func loadFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return loadFromNib(self)
    }
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
