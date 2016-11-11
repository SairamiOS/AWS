//
//  SecoundViewController.swift
//  AWS
//
//  Created by GEIDC on 10/24/16.
//  Copyright © 2016 GEIDC. All rights reserved.
//

import UIKit

class SecoundViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!

    @IBOutlet weak var postSwitch: UISwitch!

    @IBOutlet weak var getUpdateView: UIView!
    
    @IBOutlet weak var marvelView: UIView!
    
    @IBOutlet weak var getUpdataBnt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.white

        getUpdateView.layer.cornerRadius = 10;
        getUpdateView.layer.masksToBounds = true;
        
        getUpdateView.layer.borderColor = UIColor.gray.cgColor;
        getUpdateView.layer.borderWidth = 0.5;
        
        
        
        marvelView.layer.cornerRadius = 10;
        marvelView.layer.masksToBounds = true;
        
        marvelView.layer.borderColor = UIColor.gray.cgColor;
        marvelView.layer.borderWidth = 0.5;

        
        getUpdataBnt.layer.cornerRadius = 10;
        getUpdataBnt.layer.masksToBounds = true;
        
        
        
        // Do any additional setup after loading the view.
         makeGetRequest()
    }
    
    
   // mySwitch.addTarget(self, action: #selector(switchChanged(_:)), for: UIControlEvents.valueChanged)
    
    
    @IBAction func postDataPassing(_ sender: AnyObject) {
    }
    
    @IBAction func postDataPassingObj(_ sender: UISwitch) {
        
        if postSwitch.isOn {
            // handle on
            print("ON")
        } else {
            // handle off
            print("OFF")

        }
        
       // makePostRequest()
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
    
    // MARK: -  make GET Request
    
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
    }
    
    
    // MARK: -  make POST Request
    
    func makePostRequest(){
        
        let urlPath: String = "https://hr0sdvayy5.execute-api.us-west-2.amazonaws.com/beta/iotsetled/$state"
        let url: NSURL = NSURL(string: urlPath)!
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        
        request.httpMethod = "POST"
        let stringPost="firstName=James&lastName=Bond" // Key and Value
        
        let data = stringPost.data(using: String.Encoding.utf8)
        
        request.timeoutInterval = 60
        request.httpBody=data
        request.httpShouldHandleCookies=false
        
        //  let queue:OperationQueue = OperationQueue()
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")})
        
        task.resume()
        
        //        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue(), completionHandler: {(response: URLResponse?, data: NSData?, error: NSError?) -> Void in
        
        //            var error: AutoreleasingUnsafeMutablePointer<NSError?>? = nil
        //            let jsonResult: NSDictionary! = JSONSerialization.JSONObjectWithData(data, options:JSONSerialization.ReadingOptions.MutableContainers, error: error) as? NSDictionary
        
        do{
            
            if let responseObj = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                
                if JSONSerialization.isValidJSONObject(responseObj){
                    //Do your stuff here
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
        
        
        //            if (jsonResult != nil) {
        //                // Success
        //                print(jsonResult)
        //
        //                let message = jsonResult["Message"] as! NSString
        //
        //                print(message)
        //            }else {
        //                // Failed
        //                print("Failed")
        //            }
        
    }

}
