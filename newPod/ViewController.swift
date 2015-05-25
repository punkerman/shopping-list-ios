//
//  ViewController.swift
//  newPod
//
//  Created by test on 4/27/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

import UIKit
import SwiftHTTP
import ObjectMapper
class ViewController: UIViewController {

    @IBOutlet weak var nameRest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
   /*     var request = HTTPTask()
        request.GET("http://localhost:3000/restaurants", parameters: nil, success: {(response: HTTPResponse) in
            if let data = response.responseObject as? NSData {
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("response: \(str)") //prints the HTML of the page
            
                var jsonErrorOptional: NSError?
                let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonErrorOptional)
                if let statusArray: Array<AnyObject> = jsonOptional as? Array{
                    for rest in statusArray{
                        //println("rest \(rest)")
                        let restaurant:Restaurant = Mapper<Restaurant>().map(rest)!
                        println("rest \(restaurant.name)")
                        var name = restaurant.name
                        println(name)
                        self.nameRest.text = name!
                    }
                }
                
                
            }
            },failure: {(error: NSError, response: HTTPResponse?) in
                println("error: \(error)")
        })
        */
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

