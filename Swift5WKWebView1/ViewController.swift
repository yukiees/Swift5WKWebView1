//
//  ViewController.swift
//  Swift5WKWebView1
//
//  Created by 松島優希 on 2020/08/09.
//  Copyright © 2020 松島優希. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    var webview = WKWebView()

    
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var indicatar: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //大きさ
        webview.frame = CGRect(x: 0, y: toolbar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolbar.frame.size.height*2)
        view.addSubview(webview) //設定したものを貼るコード
        
        
        //何をロードするのか
        webview.navigationDelegate = self
        let url = URL(string: "https://www.yahoo.co.jp/")
        let request = URLRequest(url: url!)
        webview.load(request) //loadはimport WebKitによるもの
        
        //どこにつけるのか
        
    }
    
    //ロードが開始したとき
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        print("読み込み開始")
        indicatar.startAnimating()
    }
    
    //ロードが完了したとき
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        print("ロード完了")
        indicatar.stopAnimating()
    }
    
    @IBAction func go(_ sender: Any) {
        
        webview.goForward()
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        webview.goBack()
    }
    
}

