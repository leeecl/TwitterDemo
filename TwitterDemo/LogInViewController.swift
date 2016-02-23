//
//  LogInViewController.swift
//  TwitterDemo
//
//  Created by lesleychai on 2/22/16.
//  Copyright © 2016 lichai. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    @IBAction func onLogInButton(sender: AnyObject) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "BIeDdyrkl7XYAyWzwDSDoxjuO", consumerSecret: "FDCVXE6xP5kkwhzXt2M1dgWTl3jJEFe7h9zKEZ49vhBEaBCRD8")
        
        twitterClient.deauthorize()
        twitterClient.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterDemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("I've got a token.")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(url)
            
            })  { (error: NSError!) -> Void in
                print("error:\(error.localizedDescription)")
        
        }
        
    }

    
    

}
