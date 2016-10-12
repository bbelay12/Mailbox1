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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var rightIcon: UIImageView!
    @IBOutlet weak var rescheduleImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var leftIcon: UIImageView!
    @IBOutlet weak var feedView: UIImageView!
    var messageOriginalCenter: CGPoint!
    var messageOffset: CGFloat!
    var messageCenter: CGPoint!
    var messageLeft: CGPoint!
    var messageRight: CGPoint!
    var leftIconOriginalCenter: CGPoint!
    var rightIconOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageOffset = 0
        messageRight = CGPoint(x: messageView.center.x - messageOffset,y: messageView.center.y)
        messageLeft = CGPoint(x: messageView.center.x + messageOffset,y: messageView.center.y)
        scrollView.contentSize = CGSize(width: 320, height: 2000)
        scrollView.delegate = self
        
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        
        self.rightIcon.alpha = self.convertValue(value: Float(translation.x), r1Min: 0, r1Max: -60, r2Min: 0, r2Max: 1)
        self.leftIcon.alpha = self.convertValue(value: Float(translation.x), r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
        
        
        if sender.state == UIGestureRecognizerState.began {
            leftIconOriginalCenter = leftIcon.center
            rightIconOriginalCenter = rightIcon.center
            messageOriginalCenter = messageView.center
            let location = sender.location(in: view)
            let velocity = sender.velocity(in: view)
            
        } else if sender.state == .changed {
            print("has changes")
            messageImage.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            print(translation.x)
            
            if translation.x < 0 {
                leftIcon.alpha = 0
            } else {
                rightIcon.alpha = 0
            }
            rightIcon.image = UIImage(named:"later_icon")
            leftIcon.image = UIImage(named:"archive_icon")
            
            if translation.x < -60 && translation.x > -260 {
                messageView.backgroundColor = UIColor.yellow
                rightIcon.image = UIImage(named:"list_icon")
                
                rightIcon.center = CGPoint(x: rightIconOriginalCenter.x + translation.x + 60, y: rightIconOriginalCenter.y)
                print(rightIconOriginalCenter.x + translation.x + 60)
            }else
                if translation.x < -60 {
                    messageView.backgroundColor = UIColor.orange
                    rightIcon.image = UIImage(named: "later_icon")
                    rightIcon.center = CGPoint(x: rightIconOriginalCenter.x + translation.x + 60, y: rightIconOriginalCenter.y)
                    
                }else if translation.x > 60 && translation.x < 260 {
                    messageView.backgroundColor = UIColor .green
                    leftIcon.image = UIImage (named: "archive_icon")
                    leftIcon.center = CGPoint(x: leftIconOriginalCenter.x + translation.x - 60, y: leftIconOriginalCenter.y)
                    
                }else if translation.x > 260 {
                    messageView.backgroundColor = UIColor.red
                    leftIcon.image = UIImage(named:"delete_icon")
                    leftIcon.center = CGPoint(x: leftIconOriginalCenter.x + translation.x - 60, y: leftIconOriginalCenter.y)
                    
                    
                }else{
                    messageView.backgroundColor = UIColor.lightGray
            }
            
        }else if sender.state == .ended {
            print("has ended")
            let velocity=sender.velocity(in: view)
            
            if translation.x > -60 && translation.x < 0 {
                UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    
                    self.messageImage.center=self.messageOriginalCenter}, completion: nil)
                
            } else if translation.x < -60 && translation.x > -260 {
                UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    
                    self.messageImage.frame.origin.x = (self.messageView.frame.width * -1)
                    self.rightIcon.frame.origin.x = 15
                    }, completion: {(Bool) in
                        self.rescheduleImageView.alpha = 1
                })
            } else if translation.x < -260 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.messageImage.frame.origin.x = (self.messageImage.frame.size.width * -1)
                                self.rightIcon.frame.origin.x = 15
                    }, completion: {(Bool)  in
                        self.listImageView.alpha = 1
                        
                })
                
                
            }
            if translation.x < 60 && translation.x > 0 {
                UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    
                    self.messageImage.center=self.messageOriginalCenter}, completion: nil)
                
            }
            else if translation.x > 60 && translation.x < 260 {
                //UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    
                    self.messageImage.frame.origin.x = (self.messageImage.frame.width * 2)
                    self.leftIcon.frame.origin.x = self.messageImage.frame.width - 45
                    UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                        self.feedView.frame.origin.y = self.messageView.frame.origin.y
                        }, completion: {(Bool) in
                            
                    })
                    
                    
                }else if translation.x > 260{
                    UIView.animate(withDuration:0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    self.messageImage.frame.origin.x = (self.messageImage.frame.width * 2)
                    self.leftIcon.frame.origin.x = self.messageImage.frame.width - 45
                    self.feedView.frame.origin.y = self.messageView.frame.origin.y
                    }, completion: {(Bool) in
                    
                             })
                    }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -20 {
            self.messageImage.center = self.messageOriginalCenter
            self.leftIcon.center = self.leftIconOriginalCenter
            self.rightIcon.center = self.rightIconOriginalCenter
            self.feedView.frame.origin.y = (self.messageView.frame.origin.y + self.messageView.frame.size.height)
        }

    }
    @IBAction func rescheduleTapped(_ sender: UITapGestureRecognizer) {
        self.rescheduleImageView.alpha = 0
        UIView.animate(withDuration:0.3, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.feedView.frame.origin.y = self.messageView.frame.origin.y
            }, completion: nil)
        
        
    }
    
    @IBAction func listTapped(_ sender: UITapGestureRecognizer) {
        self.listImageView.alpha=0
        UIView.animate(withDuration:0.3, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.feedView.frame.origin.y = self.messageView.frame.origin.y
            }, completion: nil)
    }
    
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> CGFloat {
        let ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return CGFloat(value * ratio + r2Min - r1Min * ratio)
        
    }
}

