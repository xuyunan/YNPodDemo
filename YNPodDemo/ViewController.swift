//
//  ViewController.swift
//  YNPodDemo
//
//  Created by tommy on 2017/4/2.
//  Copyright © 2017年 xu_yunan@163.com. All rights reserved.
//

import UIKit
import Alamofire
import YNWebViewController
import HexColors

class ViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(hex:0xFF0000)
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request ?? "")  // original URL request
            print(response.response ?? "") // HTTP URL response
            print(response.data ?? "")     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
    @IBAction func presentController(_ sender: AnyObject) {
        let webViewController = YNWebViewController(url: URL(string: "https://www.baidu.com")!)
        webViewController.delegate = self
        let navController = UINavigationController(rootViewController: webViewController)
        self.present(navController, animated: true, completion: nil)
    }
    
    // MARK: - UIWebViewDelegate
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webViewDidFinishLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

