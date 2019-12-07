//
//  DownloadBase.swift
//  PeopleOfStarWars
//
//  Created by Ben Oliverson on 12/7/19.
//  Copyright © 2019 Ben Oliverson. All rights reserved.
//

import Foundation

class DownloadBase: NSObject {
    let session = URLSession.shared
    
    func url() -> String? {
        return nil
    }
    
    func jsonKey() -> String? {
        return nil
    }
    
    func saveData(item: Dictionary<String,Any>){
        
    }
    
    func downloadAction() {
        
        let urlString = self.url() ?? "No URL"
        
        let task = session.dataTask(with: URL(string: urlString)!, completionHandler: {data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "text/plain" else {
                print("Wrong MIME type!")
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                let jsonKey = self.jsonKey()!
                let objects = json["\(jsonKey)"] as! [Dictionary<String,Any>]
                for item in objects{
                    self.saveData(item: item)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        
        task.resume()
    }
}
