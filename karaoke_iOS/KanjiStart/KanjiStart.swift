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
    //artists[row]で値をとる
    print("取り出し" + String(sepSelect[row]))
        
    }
    @IBOutlet weak var roomKakuninId: UILabel!
    @IBOutlet weak var kakuninPassword: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }

