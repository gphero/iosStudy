//
//  WebViewController.swift
//  Test
//
//  Created by 장기웅 on 2022/08/08.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var wkWebview:WKWebView? // 선언만. viewDidLoad에서 초기화가 안될 수도 있으므로 optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // frame : 부모기준 좌표.
        // bounce : 자신 기준 좌표.
        // view = view Controller 를 의미함
        self.wkWebview = WKWebView(frame: self.view.frame)
        self.view.addSubview(self.wkWebview!)
        
        let url = URL(string: "https://www.naver.com")
        let requestUrl = URLRequest(url: url!)
        
        self.wkWebview!.load(requestUrl)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
