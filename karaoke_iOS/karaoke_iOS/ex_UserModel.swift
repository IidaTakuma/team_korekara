//
//  ex_UserModel.swift
//  karaoke_iOS
//
//  Created by 飯田拓馬 on 2018/06/17.
//  Copyright © 2018年 CATK. All rights reserved.
//

import Foundation

struct User:Codable {
    let id : String
    let name : String
    let airtists : [Artist]
    let is_public : Bool
}
