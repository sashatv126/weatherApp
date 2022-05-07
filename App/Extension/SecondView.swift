//
//  UIKit + PageControl.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import UIKit

extension SecondViewController {
    
     
    
     func setupPage() {
        let assembly = AssemblyBuilder()
        
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        
        let page1 = assembly.createFirstPage()
        let page2 = assembly.createSecondPage()
        let page3 = assembly.createThirdPage()
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        
    }
    
    func style() {
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }
    
    func layout() {
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1)
        ])
    }
}

extension SecondViewController {
    @objc
    func pageControlTapped(_ sender : UIPageControl) {
        
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

extension SecondViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewcontrollers = pageViewController.viewControllers else {
            return
        }
        guard let currentIndex = pages.firstIndex(of: viewcontrollers[0]) else {
            return
        }
        
        pageControl.currentPage = currentIndex
    }
    
    
}
