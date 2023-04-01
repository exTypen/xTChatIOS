//
//  NetworkHelper.swift
//  xTChat
//
//  Created by Yasir Kılınç on 1.04.2023.
//

import Foundation

enum HTTPMethods:String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidUrl = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper{
    static let shared = NetworkHelper()
}
