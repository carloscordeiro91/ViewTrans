//
//  ViewController.swift
//  ViewTrans
//
//  Created by Carlos Cordeiro on 23/03/2020.
//  Copyright © 2020 Carlos Cordeiro. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    lazy var orangeView: UIView = {
        
        let _orangeView = UIView()
        
        _orangeView.backgroundColor = .orange
        
        return _orangeView
         
    }()
    
    lazy var redView: UIView = {
      
        let _redView = UIView()
        
        _redView.backgroundColor = .red
        
        return _redView
        
    }()
    
    enum ViewType {
        
        case orange, red
    }
    
    var currentType: ViewType = .orange
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.addSubview(redView)
        
        redView.frame.size = containerView.frame.size
        
        redView.frame.origin = CGPoint(x: 0, y: 0)
        
        containerView.addSubview(orangeView)
        
        orangeView.frame.size = containerView.frame.size
        
        orangeView.frame.origin = CGPoint(x: 0, y: 0)
        
        


    }
    
    
    @IBAction func transitionView(_ sender: Any) {
        
        
        switch currentType {
            
        case .orange:
            
            
            UIView.transition(with: containerView, duration: 1.0, options: [.transitionCurlUp], animations: {
                
                self.orangeView.removeFromSuperview()
                
                self.containerView.addSubview(self.redView)
                
            }) { (success) in
                
                self.currentType = .red
            }
            
        case .red:
            
            UIView.transition(with: containerView, duration: 1.0, options: [.transitionCurlDown], animations: {
                
                self.redView.removeFromSuperview()
                
                self.containerView.addSubview(self.orangeView)
                
            }) { (success) in
                
                self.currentType = .orange
            }
            
        }
        
        
        /*
        switch currentType {
            
        case .orange:
            
            UIView.transition(from: orangeView, to: redView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews]) { (success) in
                
                self.currentType = .red
                
            }
            
        case .red:
            
            UIView.transition(from: redView, to: orangeView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews]) { (success) in
                
                self.currentType = .orange
                    
            }
        }
 
 */
    }
    


}

