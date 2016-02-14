//
//  LoginViewController.swift
//  HW2CodePathCarousel
//
//  Created by Matthew Verghese on 2/11/16.
//  Copyright (c) 2016 Cheeeese. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var loginNavBar: UIImageView!

    @IBAction func didTap(sender: AnyObject) {
        print("did tap")
        view.endEditing(true)
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    @IBAction func didPressLogin(sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            self.loginIndicator.stopAnimating()
            let alertController = UIAlertController(title: "Email Required", message: "Please enter your email", preferredStyle: .Alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
                        
            presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            }
        }
        else {
            self.loginIndicator.startAnimating()
            
            delay(2) {
                if self.emailField.text == "t" && self.passwordField.text == "t" {
                    println("correct email and password")
                    self.performSegueWithIdentifier("signInSegue", sender: self)
                }
                else {
                    self.loginIndicator.stopAnimating()
                    println("email is \(self.emailField.text) and password is \(self.passwordField.text)")
                    let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid email and password", preferredStyle: .Alert)
                    
                    // create a cancel action
                    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    self.presentViewController(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                        
                    }
                }
                
            }

        }
    }


    // define the variables for offsetting scroll with the keyboard
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        println("reached show")
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        scrollView.contentOffset.y = scrollView.contentInset.bottom
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        println("reached hide")
        buttonParentView.frame.origin.y = buttonInitialY
        
    }
   
    func delay(delay:Double, closure:()->()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay*Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
    }
    
    @IBAction func pressBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        println(scrollView.contentOffset.y)
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
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
