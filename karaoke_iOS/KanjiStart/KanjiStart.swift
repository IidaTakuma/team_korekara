//
//  KanjiStart.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class KanjiStart: UIViewController {

    @IBOutlet weak var roomId: UILabel!
    @IBOutlet weak var password: UILabel!
    
    @IBOutlet weak var omakase: UIButton!
    @IBOutlet weak var ganre: UIButton!
    @IBOutlet weak var artist: UIButton!
    
    @IBOutlet weak var start: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
