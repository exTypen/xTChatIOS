//
//  SingleResponseModel.swift
//  xTChat
//
//  Created by Yasir Kılınç on 31.03.2023.
//

import Foundation

struct SingleResponseModel<T:Codable>:Codable{
    var data:T?
    var success:Bool
    var message:String
}
