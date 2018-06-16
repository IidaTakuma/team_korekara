//
//  mypage.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit

class mypage: UIViewController {
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var privateBtn: UIButton!
    @IBOutlet weak var likeArtist1: UILabel!
    @IBOutlet weak var likeArtist2: UILabel!
    @IBOutlet weak var likeArtist3: UILabel!
    @IBOutlet weak var deleteBtn1: UIButton!
    @IBOutlet weak var deleteBtn2: UIButton!
    @IBOutlet weak var deleteBtn3: UIButton!
    
//    var myId: String!
    
    @IBAction func editBtn(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user_syousai()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
