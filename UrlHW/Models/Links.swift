//
//  Links.swift
//  UrlHW
//
//  Created by Акира on 08.08.2023.
//

import Foundation

enum Links: String {
   
    case animeBoys
    case animeGirls
    
    var url: URL {
        
        switch self {
        case .animeBoys:
            return URL(string:"https://api.catboys.com/img")!
        case .animeGirls:
            return URL(string: "https://api.waifu.pics/sfw/waifu")!
        }
    }
    
    
    
}
