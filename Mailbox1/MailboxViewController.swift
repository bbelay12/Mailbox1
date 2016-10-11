//
//  MailboxViewController.swift
//  Mailbox1
//
//  Created by Belay, Betelhem on 10/5/16.
//  Copyright © 2016 Belay, Betelhem. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var messageOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var messageCenter: CGPoint!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!
    
    
    var greyColour = UIColor(red: 227/255.0, green: 225/255.0, blue: 227/255.0, alpha: 1.0)
    var yellowColour = UIColor(red: 251/255.0, green: 210/255.0, blue: 51/255.0, alpha: 1.0)
    var brownColour = UIColor(red: 216/255.0, green: 165/255.0, blue: 116/255.0, alpha: 1.0)
    var redColour = UIColor(red: 235/255.0, green: 83/255.0, blue: 51/255.0, alpha: 1.0)
    var greenColour = UIColor(red: 112/255.0, green: 217/255.0, blue: 98/255.0, alpha: 1.0)
    var blueColour = UIColor(red: 113/255.0, green: 197/255.0, blue: 225/255.0, alpha: 1.0)
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageOffset = 0
        messageRight = CGPoint(x: messageImage.center.x - messageOffset,y: messageImage.center.y)
        messageLeft = CGPoint(x: messageImage.center.x + messageOffset,y: messageImage.center.y)
        
        //imageView = imageView.center
        //trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
        scrollView.contentSize = CGSize(width: 320, height: 2000)
        scrollView.delegate = self
        
        // var edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: "onEdgePan:")
        //edgeGesture.edges = UIRectEdge.left
        // contentView.addGestureRecognizer(edgeGesture)
        self.navigationController?.isNavigationBarHidden = true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        
       // messageOriginalCenter = messageView.center
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
       // messageView.center = translation
        
        if sender.state == UIGestureRecognizerState.began {
            messageOriginalCenter = messageImage.center
            //ony animation here
            print("has began")
        } else if sender.state == .changed {
            messageImage.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if translation.x < -60 {
                self.messageView.backgroundColor = self.yellowColour
            }
            if translation.x < -260 {
                self.messageView.backgroundColor = self.brownColour
            }
            print("has changed")
        } else if sender.state == .ended {
//            UIView.animate(withDuration: 0.2, animations: {self.messageView.transform = CGAffineTransform(scaleX: 1, y: 1)
//                
//                if translation.x < 0 {
//                    
//                    UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
//                                   animations: { () -> Void in
//                                    self.messageImage.center = self.messageRight
//                        }, completion: nil)
//                    print("has ended")
//                    
//                }
//            })
            
            
        }
    }
}

    
