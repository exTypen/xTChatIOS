//
//  ListResponseModel.swift
//  xTChat
//
//  Created by Yasir Kılınç on 31.03.2023.
//

import Foundation

struct ListResponseModel<T:Codable>:Decodable,Encodable{
    var data:[T]
    var success:Bool
    var message:String
}
