//
//  ex_Access_TokenModel.swift
//  karaoke_iOS
//
//  Created by 飯田拓馬 on 2018/06/17.
//  Copyright © 2018年 CATK. All rights reserved.
//

import Foundation

class FetchUser { //ex_UserModelと被っているためこの名前にした
    var id : String = ""
    var name : String = ""
    var airtists : [Artist] = []
    var is_public : Bool = false
}
