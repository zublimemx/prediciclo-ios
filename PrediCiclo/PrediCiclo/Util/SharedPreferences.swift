//
//  SharedPreferences.swift
//  Prediciclo
//
//  Created by Carlos H. Torres on 12/9/19.
//  Copyright © 2019 Carlos H. Torres. All rights reserved.
//

import Foundation
class Preferences {
    
    let headers = ["Authorization":"Basic Y2tfNWVjYjQ0ODI4NjczYjAyYmJmYWE4ODZhZDE1MmU0M2Y5MjNjODFmMTpjc19lM2ZiN2ZhZDRlNjMzOTc4MDA1ZDM5MDk5ZDg5YzgxMTg4MDNlMTg3","Content-Type": "application/x-www-form-urlencoded"]
          
    func getUsername() -> String{
        return UserDefaults.standard.string(forKey: "username") ?? ""
    }
    func setUsername(user:String){
        UserDefaults.standard.set(user, forKey: "username")
    }
    
    func getPasswd() -> String{
         return UserDefaults.standard.string(forKey: "password") ?? ""
     }
     func setPasswd(pass:String){
         UserDefaults.standard.set(pass, forKey: "password")
     }
    
    func getUserId() -> Int{
        
        return UserDefaults.standard.integer(forKey: "userId")
    }
    func setUserId(userId:Int){
        UserDefaults.standard.set(userId, forKey: "userId")
    }
    func isLogged() -> Bool{
        
        return UserDefaults.standard.bool(forKey: "logged")
    }
    func setLogged(_ logged:Bool){
        UserDefaults.standard.set(logged, forKey: "logged")
    }
    
    func setString(key:String, value:String){
        UserDefaults.standard.set(value, forKey: key)
        
    }
    func getString(key:String) -> String {
        return UserDefaults.standard.string(forKey:key) ?? ""
    }
    
}
