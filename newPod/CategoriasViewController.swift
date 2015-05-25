//
//  CategoriasViewController.swift
//  newPod
//
//  Created by internet on 5/24/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

import UIKit

class CategoriasViewController: UIViewController {

    @IBOutlet weak var meatBtn: UIButton!
    @IBOutlet weak var drinksBtn: UIButton!
    @IBOutlet weak var pastaBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "meat"{
          if  let selectCategory = segue.destinationViewController as? ProductsTableViewController {
                selectCategory.category = "meat"
            }
        
        }
        
        
        
        if segue.identifier == "drinks"{
            if let selectCategory = segue.destinationViewController as? ProductsTableViewController{
                
                selectCategory.category = "drink"
            }
        }
        if segue.identifier == "pasta"{
            if let selectCategory = segue.destinationViewController as? ProductsTableViewController{
                
                selectCategory.category = "pasta"
            }
        }

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
