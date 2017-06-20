//
//  ViewController.swift
//  WebBrowser
//
//  Created by Dasha Daniyalian on 4/22/17.
//  Copyright © 2017 Dasha Daniyalian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var addressBar: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadURL(string: "http://jolietboatstore.com")
    }
    func loadURL(string: String){
        let requestURL: String!
        if string.hasPrefix("http://") || string.hasPrefix("https://") {
            requestURL = string
        } else {
            requestURL = "http://\(string).com"
        }
        
        let url = URL(string: requestURL)
        let request = URLRequest(url: url!)
        self.webView.loadRequest(request)
    }
    
    @IBAction func navigate(_ sender: UIBarButtonItem) {
        switch sender.tag{
        case 10:
            if self.webView.canGoBack{
                self.webView.goBack()
            }
        case 20:
            if self.webView.canGoForward{
                self.webView.goForward()
            }
        default:
            print("Unexpected Sender")
            
        }
    }
}

extension ViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.spinner.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.spinner.stopAnimating()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loadURL(string: textField.text!)
        return textField.resignFirstResponder()
    }
    
}
