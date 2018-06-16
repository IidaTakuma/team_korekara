//
//  ViewController.swift
//  karaoke_iOS
//
//  Created by 飯田拓馬 on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource   {
    var artists = [["1","2","3"],["1","2","3"],["1","2","3"]]
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
        
        return artists[component][row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        // 処理
        //artists[row]で値をとる
        print("取り出し" + String(artists[component][row]))
        
        switch selectedbtnTag {
        case 0:
            artist1.setTitle(String(artists[0][row]), for: .normal)
            break
            
        case 1:
            artist2.setTitle(String(artists[1][row]), for: .normal)
            break
            
        case 2:
            artist3.setTitle(String(artists[2][row]), for: .normal)
            break
            
        default:
            break
        }
    }
    // SinkiToroku だよ
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var artist1: UIButton!
    @IBOutlet weak var artist2: UIButton!
    @IBOutlet weak var artist3: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var selectedbtnTag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.showsSelectionIndicator = true
        pickerView.dataSource = self
        pickerView.delegate = self
        //        pickerView.center = self.view.center
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
    
}

