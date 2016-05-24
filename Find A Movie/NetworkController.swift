//
//  NetworkController.swift
//  Find A Movie
//
//  Created by Alexander on 5/23/16.
//  Copyright © 2016 Alex Bateman. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(url: String, completion: (data: NSData?) -> Void) {
        guard let url = NSURL(string: url) else {completion(data: nil); return}
        

        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(data: nil)
            } else {
                if let data = data {
                    completion(data: data)
                } else {
                    print("No data return from network request")
                    completion(data: nil)
                }
            }
        }
        task.resume()
    }
    
    static func jsonWithReturn(data: NSData) -> [String: AnyObject]? {
        return (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject]
    }
}
