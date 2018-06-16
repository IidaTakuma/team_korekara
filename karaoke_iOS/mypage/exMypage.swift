//
//  exMypage.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import Foundation
import Alamofire

extension mypage {
    
    func user_syousai(){
        //パラメータとしてアクセストークンを追加
        let authToken = [
            "Access-Token": UserDefaults.standard.string(forKey: "Access-Token")
        ]
        Alamofire.request("http://160.16.77.36:8000/api/user/",headers:authToken).response(completionHandler: { response in
            if let data = response.data {
                print(data)
                let result = try! JSONDecoder().decode(User.self, from: data)
                self.userId.text = result.id//取ってきたuserのID
                self.likeArtist1.text = result.airtists[0].name//取ってきたartists配列の0
                self.likeArtist2.text = result.airtists[1].name//取ってきたartists配列の1
                self.likeArtist3.text = result.airtists[2].name//取ってきたartists配列の2
            }
        })
    }
}
