//
//  ViewController.swift
//  AWS
//
//  Created by GEIDC on 10/24/16.
//  Copyright © 2016 GEIDC. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var mainScreenView: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        emailTextfield.delegate = self                  //set delegate to textfile
//        passwordTextField.delegate = self                  //set delegate to textfile
//<<<<<<< HEAD
    
        print("add :",addTwoInts(4, 5))
//=======
//<<<<<<< HEAD
    
        print("add :",addTwoInts(4, 5))
//=======
//  
    //magic
//>>>>>>> origin/develop
//>>>>>>> develop
 
        print("multiple: ", multiplyTwoInts(4, 5))
        
        // code developo in develop branch
        print(greetAgain(person: "Anna"))
        print(greetAgain(person: "Brian"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print("viewWillAppear 👍 Called")
        
        emailTextfield.text = ""
        passwordTextField.text = ""

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    /// Marke : develop code in develp branch
    
    func greetAgain(person: String) -> String {
        return "Hello again, " + person + "!"
    }

    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
   

//<<<<<<< HEAD
//=======
    
//>>>>>>> develop
    
    //Mark: multiple 
    
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    
 // button event ----//
    @IBAction func SeconViewController(_ sender: UIButton) {
        
        print("Button pressed 👍")
        
        
        if isValidEmail(testStr: emailTextfield.text!) && !((passwordTextField.text?.isEmpty)!) && ((passwordTextField.text?.characters.count)! <= 5) {
            
            print("is valid ")
    
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let secondView = storyBoard.instantiateViewController(withIdentifier: "seconView") as! SecoundViewController
            
            
            self.navigationController?.pushViewController(secondView, animated: true)

        
            
        }else
        {
            // Initialize Alert Controller
            let alertController = UIAlertController(title: "Alert", message: "Please enter valid details", preferredStyle: .alert)
            
            // Initialize Actions
            let yesAction = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
                print("The user is okay.")
            }
            
            
            // Add Actions
            alertController.addAction(yesAction)
           
            
            // Present Alert Controller
            self.present(alertController, animated: true, completion: nil)
    
            print("not valid ")

        
        }
        
        //------------ Type of navigation navigatoin using xib -*1 -------------------//

//        let newVC = SecoundViewController(nibName: "SecoundViewController",bundle: nil)
//    
//        self.navigationController?.pushViewController(newVC, animated: true)
        
         //------------ Type of navigation  progrimaitical usiing storyboard -*2 -------------------//

//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let secondView = storyBoard.instantiateViewController(withIdentifier: "seconView") as! SecoundViewController
//        self.navigationController?.pushViewController(secondView, animated: true)
        
         //------------ Type of navigation using segue -*3 -------------------//
        
//        performSegue(withIdentifier: "seconView",
//                     sender: self)

    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    //----Textfiled delegates
//    
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
//        
//    }
//    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
//        return false
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
//        
//        textField.resignFirstResponder()
//
//        
//        return true
//    }
    
    
    func makePostRequest(){
        
        let urlPath: String = "http://www.swiftdeveloperblog.com/http-post-example-script/"
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



