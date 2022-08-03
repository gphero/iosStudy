//
//  ViewController.swift
//  Test
//
//  Created by GiUng Jang on 2022/07/08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let list = [["value":"a", "type":"1"]
                ,["value":"b", "type":"2"]
                ,["value":"c", "type":"1"]]
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //아래 두개를 코드말고 스토리보드에서 해보세요
        //self가 class를 말하는 것이므로 Table View의 delegater, dataSource를 View Controller를 지정했음
        tableView.delegate = self
        tableView.dataSource = self
        
        // 2. 셀클릭시 프린트
        
        // 숙제 labels 3개의 오토레이아웃 잡으세요.
        
        // 다음시간 : MVVM 패턴을 써보자.
        
        // 2숙제 TableViewCell 클ㄹ스에서 셀 값을 넣으세요
    }
    
    // 셀을 어떤 애로 지정할건지? 데이터 수만큼 호출
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dic = self.list[indexPath.row]
        let type = dic["type"]
        
        if ( type == "1" ){
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.setLabel1Text(dic: self.list[indexPath.row])
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell2
            cell.setLabel2Text(dic: self.list[indexPath.row])
            return cell
        }
        
    }
    
    // 데이터 수만큼 셀을 만듬 . 1번만 호출
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    // 셀마다 높이를 다르게 함. 데이터 수만큼 호출
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dic = self.list[indexPath.row]
        let type = dic["type"]
        
        if type == "1"{
            return 80
        } else {
            return 150
        }
        
    }
    
    // 셀 셀렉트 시 프린트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = self.list[indexPath.row]
        let type = dic["type"]
        
        if type == "1"{
//            Type3ViewController 만들어서 MainTwo의 Navigation컨틀러에 넣고,
//            여기서 호출 해보세요.
            let storyboard = UIStoryboard(name:"MainTwo", bundle: nil)
            if let nvc = storyboard.instantiateViewController(withIdentifier: "Type3ViewController") as? UINavigationController{
                nvc.modalPresentationStyle = .fullScreen
                let viewController = nvc.topViewController as! Type3ViewController
                viewController.param = "장기웅"
                self.present(nvc, animated: true)
            }
            
//            print("인덱스번호! : \(indexPath.row)")
//            let alert = UIAlertController(title: "장난하냐!", message: "\(indexPath.row)", preferredStyle: UIAlertController.Style.alert)
//
//            alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { _ in
//                print("YES")
//            }))
//
//            alert.addAction(UIAlertAction(title: "NO", style: .cancel))
//
//            present(alert, animated: true)
//
        } else {
            //숙제 : Type2ViewController를 띄우세요. 세그웨이 말고.
            //storyboard를 통해 두번쨰 화면의 storyboard ID를 참조하여 뷰 컨트롤러를 가져옵니다.
//                guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "Type2ViewController") else {
//                    return
//                }
//
//                //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
//                svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//
//                //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
//                self.present(svc, animated: true)
            
            let storyboard = UIStoryboard(name:"Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "Type2ViewController") as! Type2ViewController
            viewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen // 풀스크린으로 뷰컨트롤러를 넘겨 줌
            // viewController.param = true // 뒤로가기 버튼 숨김
            self.present(viewController, animated: true)
            
        }
    }
    
    
}

