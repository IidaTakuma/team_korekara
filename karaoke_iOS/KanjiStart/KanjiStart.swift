//
//  KanjiStart.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class KanjiStart: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource   {
    var sepSelect = ["ランダム","アーティスト"]
    var selectedbtnTag: Int = 0
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return sepSelect.count
    }
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    // UIPickerViewの行数、要素の全数
    func pickerView(_ pickerView: UIPickerView,
    numberOfRowsInComponent component: Int) -> Int {
    return sepSelect.count
    }
    
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
    titleForRow row: Int,
    forComponent component: Int) -> String? {
    
    return sepSelect[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
    didSelectRow row: Int,
    inComponent component: Int) {
    // 処理
    //sepSelect[row]で値をとる
    print("取り出し" + String(sepSelect[row]))
        huriBtn.setTitle(String(sepSelect[row]), for: UIControlState.normal)
        
    }
    @IBOutlet weak var roomKakuninId: UILabel!
    @IBOutlet weak var kakuninPassword: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var huriBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        picker.showsSelectionIndicator = true
        picker.dataSource = self
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func huriwke(_ sender: Any) {
   
    
    let alertView = UIAlertController(
        title: "お気に入りのアーティスト",
        message: "\n\n\n\n\n\n\n\n\n",
        preferredStyle: .alert)
    
    let sepSelect = UIPickerView(frame:
        CGRect(x: 0, y: 50, width: 260, height: 162))
    sepSelect.dataSource = self
    sepSelect.delegate = self
    
    // comment this line to use white color
    sepSelect.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    
    alertView.view.addSubview(sepSelect)
    
    let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
    
    alertView.addAction(action)
        selectedbtnTag = (sender as AnyObject).tag
    self.present(alertView, animated: true, completion: {
    sepSelect.frame.size.width = alertView.view.frame.size.width
    })

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
        
    }
    @IBAction func kettei(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"UserKekka", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "userkekka") as! UserKekka
        self.present(vc, animated: true, completion: nil)
    }
    
 }
