//
//  WebViewController.swift
//  Test
//
//  Created by 장기웅 on 2022/08/08.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var topBar: UIView!
    
    // 클로져: 변수에 함수를 담아둔다.
    // lazy : 대용량 데이터를 담아서 사용할 때 메모리에 할당되지 않고, 실제 사용 시 메모리에 적재한다는 뜻
    // 개발하면 UI관련된 변수가 많아지는데 사용될 때 초기화 시켜야 메모리 분배가 됨.
    lazy var wkWebview = { [weak self] () -> WKWebView in
        var webView = WKWebView()
        
        guard let self = self else {
            return webView
        }
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "handler")
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.applicationNameForUserAgent = "/iphone"
        
        return WKWebView(frame: self.contentView.frame, configuration: config)
    }()
    
    lazy var btnClose = { [weak self]() -> UIButton in // 반환형
        var button = UIButton()
        
        guard let self = self else {
            return button
        }
        
        button.setTitle("장기웅", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: self.topBar.bounds.origin.x, y: self.topBar.bounds.origin.x, width: self.topBar.bounds.height, height: self.topBar.bounds.height)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // frame : 부모기준 좌표.
        // bounds : 자신 기준 좌표.
        // view = view Controller 를 의미함
        
        let url = URL(string: "https://www.naver.com")
        let requestUrl = URLRequest(url: url!)
        
        self.wkWebview.load(requestUrl)
        // Do any additional setup after loading the view.
        
        self.contentView.addSubview(self.wkWebview)
        self.topBar.addSubview(self.btnClose)
        // wkWebView 버그로
        self.btnClose.addTarget(self, action: #selector(self.btnCloseEvent), for: .touchUpInside)
        
        // 초기 세팅 이후 UI 변동 시 제약조건을 풀어야함.
        self.wkWebview.translatesAutoresizingMaskIntoConstraints = false //오토레이아웃 제약조건을 풀어 줌.
        // Anchor
        self.wkWebview.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.wkWebview.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        self.wkWebview.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        self.wkWebview.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc func btnCloseEvent(){
        self.dismiss(animated: true)
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

extension WebViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // 클로져에서 만든 브릿지와 통신 하기 위함
        if message.name == "handler" {
            
        }
            
    }
    
    
}

// ui 오토레이아웃 아래 3가지 활용해서 버튼 오토레이아웃 맞춰오세요
// 앤클 <- 앤 클로 헤오세요 NSLayoutAnchor?
// 비주얼포맷랭귀지
// 컨텐츠어쩌고 ? 있는데
