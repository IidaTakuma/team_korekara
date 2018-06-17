//
//  mypage.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit
import Alamofire

struct UserParam: Codable {
    var id: String
    var name: String
    var artists: [ArtistParam]
}

class mypage: UIViewController {
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var privateBtn: UIButton!
    @IBOutlet weak var likeArtist1: UILabel!
    @IBOutlet weak var likeArtist2: UILabel!
    @IBOutlet weak var likeArtist3: UILabel!
    @IBOutlet weak var deleteBtn1: UIButton!
    @IBOutlet weak var deleteBtn2: UIButton!
    @IBOutlet weak var deleteBtn3: UIButton!
    
    @IBAction func editBtn(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteBtn1.isHidden = true
        deleteBtn2.isHidden = true
        deleteBtn3.isHidden = true
        privateBtn.isHidden = true
        
        let header: HTTPHeaders = [
            "Access-Token": UserDefaults.standard.string(forKey: "access_token")!
        ]
        Alamofire.request(Const.UserAPI, headers: header).responseJSON { response in
            guard let data = response.data else { return }
            print(data)
            do {
                let user = try JSONDecoder().decode(UserParam.self, from: data)
                print(user)
                self.userId.text = user.name
                if (user.artists.count > 2) {
                    self.likeArtist1.text = user.artists[0].name
                    self.likeArtist2.text = user.artists[1].name
                    self.likeArtist3.text = user.artists[2].name
                }
            } catch {
                print("json convert failed in JSONDecoder", error.localizedDescription)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
