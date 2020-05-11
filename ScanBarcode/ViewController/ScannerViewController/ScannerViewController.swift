//
//  ScannerViewController.swift
//  ScanBarcode
//
//  Created by Nguyen Trung Hieu on 5/11/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit

class ScannerViewController: UIViewController {

    @IBOutlet weak var scannerView: QRScannerView!{
        didSet {
            scannerView.delegate = self
        }
    }
    @IBOutlet weak var textFieldScaner: UITextField!{
        didSet{
            self.textFieldScaner.addLeftImage("ic_frame")
            self.textFieldScaner.backgroundColor = .white
            self.textFieldScaner.layer.cornerRadius = 6
//            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboards))
//            tap.cancelsTouchesInView = false
//            view.addGestureRecognizer(tap)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !scannerView.isRunning {
            scannerView.stopScanning()
        }
    }
    
    
    @objc func dismissKeyboards() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func actionOk(_ sender: Any) {
    }
    
    @IBAction func reloadScaner(_ sender: Any) {
        self.textFieldScaner.text = ""
        
        if !scannerView.isRunning {
            scannerView.startScanning()
        }
    }
}


extension ScannerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}

extension ScannerViewController: QRScannerViewDelegate {
    func qrScanningDidStop() {
        print("oki")
    }
    
    func qrScanningDidFail() {
        let alert = UIAlertController(title: "Error", message: "Scanning Failed. Please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Oki", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        self.textFieldScaner.text = str
    }
    
    
    
}


extension UITextField{
    func addLeftImage(_ strImage: String) {
        let imageView = UIImageView(image: UIImage(named: strImage))
        imageView.frame = CGRect(x: 15, y: 0, width: imageView.image!.size.width, height: imageView.image!.size.height)
        let leftview = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50, height: imageView.image!.size.height))
        leftview.addSubview(imageView)
        self.leftView = leftview
        self.leftViewMode = .always
    }
}
