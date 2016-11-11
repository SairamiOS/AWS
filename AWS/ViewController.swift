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
<<<<<<< HEAD
<<<<<<< HEAD
=======
//<<<<<<< HEAD
>>>>>>> a37850c742443ec09554ab35f7f5552cb12bd734
    
        print("add :",addTwoInts(4, 5))
//=======
//<<<<<<< HEAD
    
        print("add :",addTwoInts(4, 5))
//=======
//  
    //magic
<<<<<<< HEAD
>>>>>>> origin/develop
=======
//>>>>>>> origin/develop
//>>>>>>> develop
>>>>>>> a37850c742443ec09554ab35f7f5552cb12bd734
 
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
        
     
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
        
}



