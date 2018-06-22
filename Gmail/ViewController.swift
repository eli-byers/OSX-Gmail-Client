//
//  ViewController.swift
//  Gmail
//
//  Created by Eli Byers on 6/21/18.
//  Copyright © 2018 Eli Byers. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        let config = WKWebViewConfiguration()
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.preferences.javaScriptEnabled = true
        
        webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Gmail"
        
//        let myURL = URL(string:"https://www.google.com/gmail/about/")
        let myURL = URL(string:"https://mail.google.com/mail/u/0/#inbox")
        let req = URLRequest(url: myURL!)
        webView.load(req)
        webView.allowsBackForwardNavigationGestures = true
    }
    
}

extension ViewController: WKNavigationDelegate {
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url {
                print("Open in new window")
                let ident = NSStoryboard.SceneIdentifier(rawValue: "mainWindow")
                let myWindowController = self.storyboard!.instantiateController(withIdentifier: ident) as! NSWindowController
                
                let req = URLRequest(url: url)
                myWindowController.showWindow(self)
                (myWindowController.contentViewController as! ViewController).webView.load(req)
//                let host = url.host, !host.hasPrefix("https://mail.google.com") {
//                NSWorkspace.shared.open(url)
//                print(url)
//                print("Redirected to browser. No need to open it locally")
                decisionHandler(.cancel)
            } else {
                print("Open it locally")
                decisionHandler(.allow)
            }
        } else {
            print("not a user click")
            decisionHandler(.allow)
        }
    }
    
}

