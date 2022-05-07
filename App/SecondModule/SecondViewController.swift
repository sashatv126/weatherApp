//
//  SecondViewController.swift
//  App
//
//  Created by Владимир on 10.04.2022.
//

import UIKit

class SecondViewController : UIPageViewController  {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    override func viewDidLoad() {
        
        setupPage()
        style()
        layout()
    }
}

