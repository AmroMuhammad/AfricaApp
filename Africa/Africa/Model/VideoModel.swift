//
//  VideoModel.swift
//  Africa
//
//  Created by Amr Muhammad on 04/03/2023.
//

import Foundation

struct Video:Codable,Identifiable{
    let id:String
    let name:String
    let headline:String
    
    var thumbnail:String{
        "video-\(id)"
    }
}
