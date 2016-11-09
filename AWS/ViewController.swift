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
//

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print("viewWillAppear 👍 Called")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    
    
    
 // button event ----//
    @IBAction func SeconViewController(_ sender: UIButton) {
        
        print("Button pressed 👍")
        
        
        if isValidEmail(testStr: emailTextfield.text!) {
            
            print("is valid ")
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let secondView = storyBoard.instantiateViewController(withIdentifier: "seconView") as! SecoundViewController
            self.navigationController?.pushViewController(secondView, animated: true)

        
            
        }else
        {
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

}

