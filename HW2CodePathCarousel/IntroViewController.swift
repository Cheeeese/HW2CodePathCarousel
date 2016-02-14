//
//  IntroViewController.swift
//  HW2CodePathCarousel
//
//  Created by Matthew Verghese on 2/11/16.
//  Copyright (c) 2016 Cheeeese. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introTile1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        introScrollView.contentSize = CGSize(width: 320, height: 1150)
        
        introScrollView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var pagePosition : Int = Int(round(scrollView.contentOffset.y))
        // println(pagePosition)
        // introTile1.center.y = CGFloat(pagePosition)

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
