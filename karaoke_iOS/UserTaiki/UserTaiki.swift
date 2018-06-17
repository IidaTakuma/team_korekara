//
//  UserTaiki.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class UserTaiki: UIViewController {

    var roomid:String!
    var flag:Bool = true
    @IBOutlet weak var roomidLabel: UILabel!
    
    @IBOutlet weak var resultButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomidLabel.text = roomid
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resultLabel(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"UserKekka", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "userkekka") as! UserKekka
        self.present(vc, animated: true, completion: nil)
        resultFlag()
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
