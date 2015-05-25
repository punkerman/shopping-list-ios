//
//  ProductsTableViewController.swift
//  newPod
//
//  Created by internet on 5/22/15.
//  Copyright (c) 2015 jvm corp. All rights reserved.
//

import UIKit
import SwiftHTTP
import ObjectMapper

class ProductsTableViewController: UITableViewController {
    var productList:Array<AnyObject> = []
    
    var category :String! = ""
    
    var baseUrl:String = "http://servtec.esy.es/webService/easyShopping.php?categoria="

    override func viewDidLoad() {
        println("Cargando lista de productos....")
        println( "el valor pasado es \(category) " )
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewDidAppear(animated: Bool) {
        
        var fullurl:String = baseUrl + "" + category
        
        var request = HTTPTask()
        request.GET(fullurl, parameters:nil, success: {(response: HTTPResponse) in
            // data is the stream that return the server
            

            if let data = response.responseObject as? NSData {
                
                // convert data to String
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
              //
                // error handler
                var jsonErrorOptional: NSError?
                // parse to JSON
                let jsonOptional: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonErrorOptional)
                // Convert JSON to Array [ { }, {json}]
               
                
                if let statusArray: Array<AnyObject> = jsonOptional["productos"] as? Array{      // iterate array
                    // map a list of restaurant from array
                    self.productList = Mapper<Product>().mapArray(statusArray)!
                    // refresh tablese
                    println("la respuesta es: \(self.productList)")
                    self.tableView.reloadData()
                                 }
             
            }
            },failure: {(error: NSError, response: HTTPResponse?) in
                println("error: \(error)")
              
        })
        //println("la respuesta es: \(HTTPResponse)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the secti
        
        return self.productList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        //let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier:"cell")
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as TableViewCell
        var product:Product = self.productList[indexPath.row] as Product
       
     
        if let url = NSURL(string: product.imagen) {
          
            if let data = NSData(contentsOfURL: url) {
                cell.imageProd.image = UIImage(data: data)
            }
          
        }else {
         cell.imageProd.image = UIImage(named: "img_noDisponible")
        }
       
        
            cell.titleProd.text = product.articulo
            cell.brandProd.text = product.marca
        cell.priceProd.text = product.precio + " " + product.relacion
        cell.plusBtn.tag = indexPath.row
        cell.plusBtn.addTarget(self, action: "prodInfo:", forControlEvents: .TouchUpInside)
            // cell.plusBtn.addTarget(self, action: "logAction:", forControlEvents: .TouchUpInside)
        
        return cell

     }
    
   
    @IBAction func prodInfo(sender: UIButton){
        
        let loginAlert = UIAlertController(title: "Realizar compra", message: "Introdusca la cantidad a comprar", preferredStyle: .Alert)
        
        let loginAction = UIAlertAction(title: "Acceptar", style: .Default) { (_) in
            let cantProd = loginAlert.textFields![0] as UITextField
            
            //aca ira el codigo para agregar a la lista pero eso se implementara para el proyecto final, ahora solo cerrara la ventana
            
            
        }
        
        loginAction.enabled = false
        
        loginAlert.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = ".:cantidad:."
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                loginAction.enabled = textField.text != ""
            }
        }
        
        
        loginAlert.addAction(loginAction)
        
        
        
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Cancel) { (_) in
            // Codigo para la accion Cancelar
        }
        
        loginAlert.addAction(cancelAction)
        
        self.presentViewController(loginAlert, animated: true) {
            
        }
        
    }
    
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
