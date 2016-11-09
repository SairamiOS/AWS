//
//  SecoundViewController.swift
//  AWS
//
//  Created by GEIDC on 10/24/16.
//  Copyright © 2016 GEIDC. All rights reserved.
//

import UIKit

class SecoundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.white

        // Do any additional setup after loading the view.
         makeGetRequest()
        // makeGetRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    var emptyDict = [String: String]()
    var arrayOfStrings = [String]()
    
    func makeGetRequest(){
        
        let req = NSMutableURLRequest(url: NSURL(string:"https://93bhiso2tj.execute-api.us-west-2.amazonaws.com/beta/get-state/*")! as URL)
        req.httpMethod = "GET"
        //req.httpBody = "body=\"value\"".data(using: String.Encoding.utf8) //This isn't for GET requests, but for POST requests so you would need to change `HTTPMethod` property
        URLSession.shared.dataTask(with: req as URLRequest) { data, response, error in
            if error != nil {
                //Your HTTP request failed.
                print(error?.localizedDescription)
            } else {
                //Your HTTP request succeeded
                print(String(data: data!, encoding: String.Encoding.utf8))
            }
            
            do{
                

                if let responseObj = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                    
                    
                    if JSONSerialization.isValidJSONObject(responseObj){
                        //Do your stuff here

                       // self.arrayOfStrings =  responseObj .object(forKey: "body") as! [String]
                        
                        //let lazyMapCollection = responseObj.allKeys
                        
//                        var stringsAsInts["body"]
                        
                        let stringArray = Array(responseObj.map { String(describing: $0) })
                        
                        // let stringArray = Array(lazyMapCollection).map { String($0) } // also works
                        print(stringArray)
                        
                      //  _ = Array(responseObj.allKeys.map { "\($0) \(responseObj[$0]!)" })

                    }
                    else{
                        //Handle error
                    }
                }
                else{
                    //Do your stuff here
                }
            }
            catch let error as NSError {
                print("An error occurred: \(error)")
            }
            
            }.resume()
        
        
        
        
        
        /*
         var myUrl : String = "http://api.androidhive.info/contacts/"
         var request : NSMutableURLRequest = NSMutableURLRequest()
         
         //var request = URLRequest (url:myUrl)
         request.url = NSURL(string: myUrl) as URL?
         request.httpMethod = "GET"
         request.timeoutInterval = 60
         
         
         let task = URLSession.shared.dataTask(with: request) {
         
         data, response, error in
         
         if error != nil {
         
         print(error!.localizedDescription)
         
         DispatchQueue.main.sync(execute: {
         
         AWLoader.hide()
         })
         return
         }
         }
         */
        
        
        
        //        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue(), completionHandler:{ (response:URLResponse!, data: NSData!, error: NSError!) -> Void in
        //
        //            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
        //
        //            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
        
        //            if (jsonResult != nil) {
        //                // Success
        //                println(jsonResult)
        //
        //                let dataArray = jsonResult["contacts"] as! NSArray;
        //
        //                for item in dataArray { // loop through data items
        //
        //                    let obj = item as! NSDictionary
        //
        //                    for (key, value) in obj {
        //
        //                        println("Key: \(key) - Value: \(value)")
        //
        //                        let phone = obj["phone"] as! NSDictionary;
        //
        //                        let mobile = phone["mobile"] as! NSString
        //                        println(mobile)
        //                        let home = phone["home"] as! NSString
        //                        println(home)
        //                        let office = phone["office"] as! NSString
        //                        println(office)
        //                    }
        //                }
        //                
        //            } else {
        //                // Failed
        //                println("Failed")
        //            }
        //            
        //        })
    }

}

///////////////////////
/*

let urlstring = "http://social.iimprove.com/PF.Base/module/mfox/api.php/user/login"
let parameters: [String: AnyObject] = [
    "sEmail" : emailTF.text!,
    "sPassword" : passwordTF.text!,
]
Alamofire.request(.POST, urlstring, parameters: parameters, encoding: .JSON).responseJSON
    {
        response in switch response.result
        {
        case .Success(let JSON):
            let response = JSON as! NSDictionary
            let keysValues = response.allValues
            
            let numStr = keysValues[0].integerValue
            if (numStr == 1)
            {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let memberWebViewController = storyBoard.instantiateViewControllerWithIdentifier("reveal") as! SWRevealViewController
                self.presentViewController(memberWebViewController, animated:true, completion:nil)
            }else
            {
                let alertView = UIAlertController(title: "Alert", message: "\(keysValues[0])", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                }
                alertView.addAction(cancelAction)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                }
                alertView.addAction(OKAction)
                
                self.presentViewController(alertView, animated: true){
                }
            }
            
        case .Failure(let error):
            print("Error Message: \(error)")
        }
}
////// get alamofire



let url = "http://api.myawesomeapp.com"
Alamofire.request(.GET, url).validate().responseJSON { response in
switch response.result {
case .Success(let data):
    let json = JSON(data)
    let name = json["name"].stringValue
    print(name)
case .Failure(let error):
    print("Request failed with error: \(error)")
}
 
}
*/
