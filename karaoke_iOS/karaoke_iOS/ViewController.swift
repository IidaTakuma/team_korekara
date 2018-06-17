//
//  ViewController.swift
//  karaoke_iOS
//
//  Created by 飯田拓馬 on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit
import Alamofire


struct ArtistParam: Codable {
    var id: String
    var name: String
}


struct TokenParam: Codable {
    var token: String
}

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource   {
//    var artists = [["1","2","3"],["1","2","3"],["1","2","3"]]
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var artist1: UIButton!
    @IBOutlet weak var artist2: UIButton!
    @IBOutlet weak var artist3: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var artist1_id: String = ""
    var artist2_id: String = ""
    var artist3_id: String = ""

    var artists: [ArtistParam] = []
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return artists.count
    }
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // UIPickerViewの行数、要素の全数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return artists.count
    }
    
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return artists[row].name
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        // 処理
        //artists[row]で値をとる
        print("取り出し" + String(artists[row].name))
        
        switch selectedbtnTag {
        case 0:
            artist1.setTitle(String(artists[row].name), for: .normal)
            artist1_id = artists[row].id
            break
            
        case 1:
            artist2.setTitle(String(artists[row].name), for: .normal)
            artist2_id = artists[row].id
            break
            
        case 2:
            artist3.setTitle(String(artists[row].name), for: .normal)
            artist3_id = artists[row].id
            break
            
        default:
            break
        }
    }
    // SinkiToroku だよ
    
    var selectedbtnTag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.showsSelectionIndicator = true
        pickerView.dataSource = self
        pickerView.delegate = self
        // pickerView.center = self.view.center
        
        let isResistered = UserDefaults.standard.bool(forKey: "is_registered")
        
        if !isResistered {
            let parameters:[String: Any] = [
                "uuid": UIDevice.current.identifierForVendor!.uuidString
            ]
            Alamofire.request(Const.AuthAPI, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
                guard let data = response.data else { return }
                    print(data)
                    do {
                        let token = try JSONDecoder().decode(TokenParam.self, from: data)
                        print(token)
                        UserDefaults.standard.set(token.token, forKey: "access_token")
                        print("set")
                        
                        let header: HTTPHeaders = [
                            "Access-Token": token.token
                        ]
                        Alamofire.request(Const.ArtistsAPI, headers:header).responseJSON { response in
                            guard let data = response.data else { return }
                            print(data)
                            do {
                                self.artists = try JSONDecoder().decode([ArtistParam].self, from: data)
                                print(self.artists)
                            } catch {
                                print("json convert failed in JSONDecoder", error.localizedDescription)
                            }
                        }
                    } catch {
                        print("json convert failed in JSONDecoder", error.localizedDescription)
                    }
                }
        } else {
            // wip
            print("skip")
            self.performSegue(withIdentifier: "toTabBar", sender: nil)
            self.next()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textAction(_ sender: UIButton) {
        let alertView = UIAlertController(
            title: "お気に入りのアーティスト",
            message: "\n\n\n\n\n\n\n\n\n",
            preferredStyle: .alert)
        
        let pickerView2 = UIPickerView(frame:
            CGRect(x: 0, y: 50, width: 260, height: 162))
        pickerView2.dataSource = self
        pickerView2.delegate = self
        
        // comment this line to use white color
        pickerView2.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        alertView.view.addSubview(pickerView2)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertView.addAction(action)
        selectedbtnTag = sender.tag
        self.present(alertView, animated: true, completion: {
            pickerView2.frame.size.width = alertView.view.frame.size.width
        })
    }
    
    func next(){
        self.performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    @IBAction func touroku(_ sender: Any) {
        let parameters: Parameters = [
            "name": UserName.text!,
            "artist_ids": [
                artist1_id,
                artist2_id,
                artist3_id,
            ]
        ]
        print(parameters)
        let header: HTTPHeaders = [
            "Access-Token": UserDefaults.standard.string(forKey: "access_token")!
        ]
        Alamofire.request(Const.UserAPI, method: .put, parameters: parameters, headers: header).validate(statusCode: 200..<400).responseData { response in
                switch response.result {
                case .success:
                    UserDefaults.standard.set(true, forKey: "is_registered")
                    self.next()
                case .failure:
                    print("failure")
                }
        }
    }
}

