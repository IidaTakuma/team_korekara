//
//  UserKekka.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class UserKekka: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableA: UITableView!
    
    @IBOutlet weak var tableB: UITableView!
    
    @IBOutlet weak var tableC: UITableView!
    let cellName = "cellName"
    
    let roomA_Array:Array = [
        "sample1","sample2"
        //APIから帰ってきたチームAの配列
    ]
    
    let roomB_Array:Array = [
        "sample1","sample2"
        //APIから帰ってきたチームBの配列
    ]
    
    let roomC_Array:Array = [
        "sample1","sample2"
        //APIから帰ってきたチームCの配列
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableA.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
        tableB.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
        tableC.register(UITableViewCell.self, forCellReuseIdentifier: cellName)
        //delegate、dataSourceはStoryBoardで設定した(たくちゃん)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag { //上からtableViewの順番で対応
        case 0:
            return 0
            
        case 1:
            return 0
            
        case 2:
            return 0
            
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as UITableViewCell
        return cell
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
