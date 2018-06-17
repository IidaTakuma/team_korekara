//
//  KanjiHeyaSakusei.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit
import Alamofire


struct GroupParam: Codable {
    var id: String
//    var name: String
    var number: Int
//    var users: [UserParam]
}

class KanjiHeyaSakusei: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var roomId: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var peopleCount: UITextField!
    
    let cellName = "cellName"
    var showList:[String] = []
//    var heyaList:[String] = ["A","B"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reload(_ sender: Any) {
        guard let data2 = peopleCount.text else { return }
        if data2.isEmpty{
            //no-op
        } else {
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count2 = Int(peopleCount.text!) else { return 0 }
        showList = []
        if count2 == 1 {
            showList.append(String(1))
        } else {
            let num1 = Int(count2 / 2)
            let num2 = count2 - num1
            showList.append(String(num1))
            showList.append(String(num2))
        }

        return showList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        cell.textLabel?.text = "部屋:" + showList[indexPath.row] + "人"
        return cell
    }
    
    func next() {
        let storyBoard = UIStoryboard(name: "KanjiStart", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "kanjistart") as! KanjiStart
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func roomMake(_ sender: Any) {
        guard let number = Int(peopleCount.text!) else {
            return
        }
        let parameters: Parameters = [
            "id": roomId.text!,
//            "password": password.text!,
            "number": number
        ]
        print(parameters)
        let header: HTTPHeaders = [
            "Access-Token": UserDefaults.standard.string(forKey: "access_token")!
        ]
        Alamofire.request(Const.GroupsAPI, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).validate(statusCode: 200..<400).responseData { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let group = try JSONDecoder().decode(GroupParam.self, from: data)
                    print(group)
                    // wip: 次はroomの作成
                    self.next()
                } catch {
                    print("json convert failed in JSONDecoder", error.localizedDescription)
                }
            case .failure:
                print("failure")
            }
        }
    }
    
}
