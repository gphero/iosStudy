//
//  ViewController.swift
//  Test
//
//  Created by GiUng Jang on 2022/07/28.
//

import Foundation
import UIKit
import Alamofire

class Type3ViewController:UIViewController {
    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    var param:String = ""
    
    // 무적권있어야 하는 생명주기. ViewController 생성 시 한번 만 가장 먼저 호출됨.
    // 버튼연결은 여기서 한번만 해주면 됨
    override func viewDidLoad() {
        super.viewDidLoad() // UIViewController에서 상속받았으므로 호출해줘야함
        self.label.text = param
        
        self.tblView.delegate = self
        self.tblView.dataSource = self
        
        
        self.btnClose.addTarget(self, action: #selector(self.btnCloseEvent), for: .touchUpInside)
        
        let url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON"
        var params:[String:String] = [:]
        params["authkey"] = "82KIO0FjdMaJHfza02btosjpyvzvYNOz"
        params["searchdate"] = "20220701"
        params["data"] =  "AP01"
        
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseString(){ response in
            if let error = response.error {
                print("에러났는디")
                print(error)
            }
            if let value = response.value {
                print(value)
            }
        }
    }
//    
    // action에서 @objc로 받는다.
    @objc func btnCloseEvent(){
        self.dismiss(animated: true) // 닫긔
    }
    
    
    // ViewController 가 여러개니까 다른 뷰 호출 시
    // 1. ViewController : viewDidLoad -> viewWillAppear -> viewDidAppear
    // 2. 화면호출 이베트발생 시
    // 3. ViewController : viewWillDisappear
    // 4. Type3ViewController : viewDidLoad -> viewWillAppear -> viewDidAppear
    // 5. ViewController : viewDidDisappear
    // 6. Type3ViewController  종료 시. : viewWillDisappear->viewDidDisappear
    // 7. ViewController : viewWillAppear -> viewDidAppear
    // viewDidLoad는 한번만 호출되므로 화면 열 때마다 새로고침 해주려면 viewDidLoad말고 viewDidApper 에서 구현해줘야함.
    
    // 사용자한테 보여주기 직전 호출
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 사용자한테 보여졌을 떄
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
        
    // 사라지기 직전에 호출
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // 사라진 직후 호출
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

// Extension
extension Type3ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}

extension Type3ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

// 숙제 ViewController의 list를 Type3에서 보여주세요
// 테이블뷰셀 3번 만들어서  그럼 Main 과 MainTwo의 데이터가 같아짐
