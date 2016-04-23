//
//  ViewController.swift
//  ZigZag_hackathon_AIU2016
//
//  Created by Suha Baobaid on 23/04/16.
//  Copyright © 2016 Suha Baobaid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func Start(sender: AnyObject) {
        self.GameOver.hidden = true
        self.Retry.hidden = true
        self.Ball.hidden = false
        self.Logo.hidden = true
        self.ScoreBoard.hidden = true
        
        self.Ball.center.x = 178.0
        self.Ball.center.y = 390.0

        
        
        self.Pillar1.center = CGPointMake(175.0, 436.0)
        self.Pillar2.center = CGPointMake(214.0, 407.0)
        self.Pillar3.center = pillarPlacement(Pillar2.center.x, y: Pillar2.center.y)
        self.Pillar4.center = pillarPlacement(Pillar3.center.x, y: Pillar3.center.y)
        self.Pillar5.center = pillarPlacement(Pillar4.center.x, y: Pillar4.center.y)
        
        self.Pillar1.hidden = false
        self.Pillar2.hidden = false
        self.Pillar3.hidden = false
        self.Pillar4.hidden = false
        self.Pillar5.hidden = false
        self.Pillar6.hidden = false
        self.Pillar7.hidden = false
        self.Pillar8.hidden = false
        self.Pillar9.hidden = false
        
        
        self.PillarTop1.hidden = false
        self.PillarTop2.hidden = false
        self.PillarTop3.hidden = false
        self.PillarTop4.hidden = false
        self.PillarTop5.hidden = false
        self.PillarTop6.hidden = false
    }
    //These are the attributes
    @IBOutlet var GameView: UIView!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var GameOver: UIImageView!
    @IBOutlet weak var ScoreBoard: UIImageView!
    @IBOutlet weak var Retry: UIButton!
    @IBOutlet weak var Ball: UIImageView!
    @IBOutlet weak var Start: UIButton!
    
    @IBOutlet weak var Pillar1: UIImageView!
    @IBOutlet weak var Pillar2: UIImageView!
    @IBOutlet weak var Pillar3: UIImageView!
    @IBOutlet weak var Pillar4: UIImageView!
    @IBOutlet weak var Pillar5: UIImageView!
    @IBOutlet weak var Pillar6: UIImageView!
    @IBOutlet weak var Pillar7: UIImageView!
    @IBOutlet weak var Pillar8: UIImageView!
    @IBOutlet weak var Pillar9: UIImageView!
    
   
    @IBOutlet weak var PillarTop1: UIImageView!
    @IBOutlet weak var PillarTop2: UIImageView!
    @IBOutlet weak var PillarTop3: UIImageView!
    @IBOutlet weak var PillarTop4: UIImageView!
    @IBOutlet weak var PillarTop5: UIImageView!
    @IBOutlet weak var PillarTop6: UIImageView!
    
    var BallCenter: CGPoint?
    var PillarTop1Center: CGPoint?
    var PillarTop2Center: CGPoint?
    var PillarTop3Center: CGPoint?
    var PillarTop4Center: CGPoint?
    var PillarTop5Center: CGPoint?
    var PillarTop6Center: CGPoint?
    
    var Pillar1Center: CGPoint?
    var Pillar2Center: CGPoint?
    var Pillar3Center: CGPoint?
    var Pillar4Center: CGPoint?
    var Pillar5Center: CGPoint?
    var Pillar6Center: CGPoint?
    var Pillar7Center: CGPoint?
    var Pillar8Center: CGPoint?
    var Pillar9Center: CGPoint?
    
    
    var timer = NSTimer()
    var TapsValid:Bool?
    var BallRight:Bool?
    var BallChange:Bool?
    var gameover = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.GameOver.hidden = true
        self.Retry.hidden = true
        self.Logo.hidden = false
        self.ScoreBoard.hidden = false
        hideGameComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hideGameComponents (){
        self.Ball.hidden = true
        self.Pillar1.hidden = true
        self.Pillar2.hidden = true
        self.Pillar3.hidden = true
        self.Pillar4.hidden = true
        self.Pillar5.hidden = true
        self.Pillar6.hidden = true
        self.Pillar7.hidden = true
        self.Pillar8.hidden = true
        self.Pillar9.hidden = true
        
        self.PillarTop1.hidden = true
        self.PillarTop2.hidden = true
        self.PillarTop3.hidden = true
        self.PillarTop4.hidden = true
        self.PillarTop5.hidden = true
        self.PillarTop6.hidden = true
    }
    
    
    func pillarPlacement(x:CGFloat , y:CGFloat ) -> (CGPoint){
        
        var pillarNewX:CGFloat
        var pillarNewY:CGFloat
        
        let random: Int = Int (arc4random() % 2)
        
        if random == 1 {
            pillarNewX = x + 39
            pillarNewY = y - 29
            
            if pillarNewX >= 285 {
                pillarNewX = x - 40
                pillarNewY = y - 30
            }
        }
        else{
            
            pillarNewX = x - 40
            pillarNewY = y - 30
            
            if pillarNewX <= 40 {
                pillarNewX = x + 39
                pillarNewY = y - 29
            }
        }
        
        return(CGPointMake(pillarNewX, pillarNewY))
    }
    

    func checkPillarPosition(y : CGFloat) -> (Bool){
        var low = false
        
        if y > 720 {
            
            low = true
        }
        
        return low
    }
    
    func movePillarUp(floatx : CGFloat, floaty: CGFloat, pillarNumber: Int) -> (CGPoint){
        var center  = CGPointMake(floatx, floaty)
        
        if checkPillarPosition(floaty) == true {
            switch pillarNumber{
                
            case 1:
                sendToBack(Pillar1)
                center = pillarPlacement(self.Pillar9.center.x, y: self.Pillar9.center.y)
                break
            case 2:
                sendToBack(Pillar2)
                center = pillarPlacement(self.Pillar1.center.x, y: self.Pillar1.center.y)
                break
            case 3:
                sendToBack(Pillar3)
                center = pillarPlacement(self.Pillar2.center.x, y: self.Pillar2.center.y)
                break
            case 4:
                sendToBack(Pillar4)
                center = pillarPlacement(self.Pillar3.center.x, y: self.Pillar3.center.y)
                break
            case 5:
                sendToBack(Pillar5)
                center = pillarPlacement(self.Pillar4.center.x, y: self.Pillar4.center.y)
                break
            case 6:
                sendToBack(Pillar6)
                center = pillarPlacement(self.Pillar5.center.x, y: self.Pillar5.center.y)
                break
            case 7:
                sendToBack(Pillar7)
                center = pillarPlacement(self.Pillar6.center.x, y: self.Pillar6.center.y)
                break
            case 8:
                sendToBack(Pillar8)
                center = pillarPlacement(self.Pillar7.center.x, y: self.Pillar7.center.y)
                break
            case 9:
                sendToBack(Pillar9)
                center = pillarPlacement(self.Pillar8.center.x, y: self.Pillar8.center.y)
                break
            default:
                break
            }
        }
        
        return center
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if TapsValid == true {
            if BallRight == true{
                
                BallChange = false
                
            }
                
            else{
                
                BallChange = true
            }
        }
    }
    
    
    
    func movement(){
        
        BallCenter = self.Ball.center
        
        Pillar1Center = self.Pillar1.center
        Pillar2Center = self.Pillar2.center
        Pillar3Center = self.Pillar3.center
        Pillar4Center = self.Pillar4.center
        Pillar5Center = self.Pillar5.center
        Pillar6Center = self.Pillar6.center
        Pillar7Center = self.Pillar7.center
        Pillar8Center = self.Pillar8.center
        Pillar9Center = self.Pillar9.center
        
        
        PillarTop1Center = self.PillarTop1.center
        PillarTop2Center = self.PillarTop2.center
        PillarTop3Center = self.PillarTop3.center
        PillarTop4Center = self.PillarTop4.center
        PillarTop5Center = self.PillarTop5.center
        PillarTop6Center = self.PillarTop6.center
        
        
        
        
        if BallChange == false {
            
            BallRight = false
        }
        else{
            BallRight = true
        }
        
        if BallRight == true{
            Ball.center.x += 3.3
            //Ball.center.y -= 0.3
        }
        else{
            Ball.center.x -= 3.3
            //Ball.center.y -= 0.3
        }
        
        //Ball.center.y += 0.3
        Pillar1.center.y += 3
        Pillar2.center.y += 3
        Pillar3.center.y += 3
        Pillar4.center.y += 3
        Pillar5.center.y += 3
        Pillar6.center.y += 3
        Pillar7.center.y += 3
        Pillar8.center.y += 3
        Pillar9.center.y += 3
        
        Pillar1.center = movePillarUp(Pillar1.center.x, floaty: Pillar1.center.y, pillarNumber: 1)
        Pillar2.center = movePillarUp(Pillar2.center.x, floaty: Pillar2.center.y, pillarNumber: 2)
        Pillar3.center = movePillarUp(Pillar3.center.x, floaty: Pillar3.center.y, pillarNumber: 3)
        Pillar4.center = movePillarUp(Pillar4.center.x, floaty: Pillar4.center.y, pillarNumber: 4)
        Pillar5.center = movePillarUp(Pillar5.center.x, floaty: Pillar5.center.y, pillarNumber: 5)
        Pillar6.center = movePillarUp(Pillar6.center.x, floaty: Pillar6.center.y, pillarNumber: 6)
        Pillar7.center = movePillarUp(Pillar7.center.x, floaty: Pillar7.center.y, pillarNumber: 7)
        Pillar8.center = movePillarUp(Pillar8.center.x, floaty: Pillar8.center.y, pillarNumber: 8)
        Pillar9.center = movePillarUp(Pillar9.center.x, floaty: Pillar9.center.y, pillarNumber: 9)
       
        
        let x_out: CGFloat = 40
        let y_out: CGFloat = 40.0
        
        if (((Ball.center.x > PillarTop1.center.x - x_out ) && (Ball.center.x < PillarTop1.center.x + x_out ) && (Ball.center.y > PillarTop1.center.y - y_out) && (Ball.center.y < PillarTop1.center.y + y_out)) ||
            ((Ball.center.x > PillarTop2.center.x - x_out) && (Ball.center.x < PillarTop2.center.x + x_out ) && (Ball.center.y > PillarTop2.center.y - y_out) && (Ball.center.y < PillarTop2.center.y + y_out)) ||
            ((Ball.center.x > PillarTop3.center.x - x_out) && (Ball.center.x < PillarTop3.center.x + x_out ) && (Ball.center.y > PillarTop3.center.y - y_out) && (Ball.center.y < PillarTop3.center.y + y_out)) ||
            ((Ball.center.x > PillarTop4.center.x - x_out) && (Ball.center.x < PillarTop4.center.x + x_out ) && (Ball.center.y > PillarTop4.center.y - y_out) && (Ball.center.y < PillarTop4.center.y + y_out)) ||
            ((Ball.center.x > PillarTop5.center.x - x_out) && (Ball.center.x < PillarTop5.center.x + x_out ) && (Ball.center.y > PillarTop5.center.y - y_out) && (Ball.center.y < PillarTop5.center.y + y_out)) ||
            ((Ball.center.x > PillarTop6.center.x - x_out) && (Ball.center.x < PillarTop6.center.x + x_out ) && (Ball.center.y > PillarTop6.center.y - y_out) && (Ball.center.y < PillarTop6.center.y + y_out)))
        {
            
            
            
        }
        else{
            gameOver()
            gameover = true
            //Ball.hidden = true
            
        }
        
        
        //to position the topPillars to follow the path of the ball
        if CGRectIntersectsRect(Ball.frame, Pillar1.frame)
        {
            self.PillarTop2.center = CGPointMake(Pillar1.center.x, Pillar1.center.y - 35)
            self.PillarTop3.center = CGPointMake(Pillar2.center.x, Pillar2.center.y - 35)
        }
        else if CGRectIntersectsRect(Ball.frame, Pillar2.frame)
        {
            self.PillarTop1.center = CGPointMake(Pillar1.center.x, Pillar1.center.y - 35)
            self.PillarTop2.center = CGPointMake(Pillar2.center.x, Pillar2.center.y - 35)
            self.PillarTop3.center = CGPointMake(Pillar3.center.x, Pillar3.center.y - 35)
            
        }
        else if CGRectIntersectsRect(Ball.frame, Pillar3.frame)
        {
            self.PillarTop4.hidden = true
            self.PillarTop5.hidden = true
            self.PillarTop6.hidden = true
            self.PillarTop1.center = CGPointMake(Pillar2.center.x, Pillar2.center.y - 35)
            self.PillarTop2.center = CGPointMake(Pillar3.center.x, Pillar3.center.y - 35)
            self.PillarTop3.center = CGPointMake(Pillar4.center.x, Pillar4.center.y - 35)
            
            
        }
        else if CGRectIntersectsRect(Ball.frame, Pillar4.frame)
        {
            self.PillarTop1.center = CGPointMake(Pillar3.center.x, Pillar3.center.y - 35)
            self.PillarTop2.center = CGPointMake(Pillar4.center.x, Pillar4.center.y - 35)
            self.PillarTop3.center = CGPointMake(Pillar5.center.x, Pillar5.center.y - 35)
            
        }
        else if CGRectIntersectsRect(Ball.frame, Pillar5.frame)
        {
            self.PillarTop1.center = CGPointMake(Pillar4.center.x, Pillar4.center.y - 35)
            self.PillarTop2.center = CGPointMake(Pillar5.center.x, Pillar5.center.y - 35)
            self.PillarTop3.center = CGPointMake(Pillar6.center.x, Pillar6.center.y - 35)
            
        }
        else if CGRectIntersectsRect(Ball.frame, Pillar6.frame)
        {
            self.PillarTop1.center = CGPointMake(Pillar5.center.x, Pillar5.center.y - 35)
            self.PillarTop2.center = CGPointMake(Pillar6.center.x, Pillar6.center.y - 35)
            self.PillarTop3.center = CGPointMake(Pillar7.center.x, Pillar7.center.y - 35)
        }
        else if CGRectIntersectsRect(Ball.frame, Pillar7.frame)
        {
            self.PillarTop1.center = CGPointMake(Pillar6.center.x, Pillar6.center.y - 35)
            self.PillarTop2.center = CGPointMake(Pillar7.center.x, Pillar7.center.y - 35)
            self.PillarTop3.center = CGPointMake(Pillar8.center.x, Pillar8.center.y - 35)
            
        }
        else if CGRectIntersectsRect(Ball.frame, Pillar8.frame)
        {
            self.PillarTop1.center = CGPointMake(Pillar7.center.x, Pillar7.center.y - 35)
            self.PillarTop2.center = CGPointMake(Pillar8.center.x, Pillar8.center.y - 35)
            self.PillarTop3.center = CGPointMake(Pillar9.center.x, Pillar9.center.y - 35)
            
        }
        else if CGRectIntersectsRect(Ball.frame, Pillar9.frame)
        {
            
            self.PillarTop1.center = CGPointMake(Pillar8.center.x, Pillar8.center.y - 35)
            self.PillarTop2.center = CGPointMake(Pillar9.center.x, Pillar9.center.y - 35)
        }
        
}
    
    
    
    //this is called whenever the images in the subviews is changed
    override func viewDidLayoutSubviews() {
        
        if let newBallCenter = BallCenter{
            self.Ball.center = newBallCenter
        }
        if let newPillar1Center = Pillar1Center{
            self.Pillar1.center = newPillar1Center
        }
        if let newPillar2Center = Pillar2Center{
            self.Pillar2.center = newPillar2Center
        }
        if let newPillar3Center = Pillar3Center{
            self.Pillar3.center = newPillar3Center
        }
        if let newPillar4Center = Pillar4Center{
            self.Pillar4.center = newPillar4Center
        }
        if let newPillar5Center = Pillar5Center{
            self.Pillar5.center = newPillar5Center
        }
        if let newPillar6Center = Pillar6Center{
            self.Pillar6.center = newPillar6Center
        }
        if let newPillar7Center = Pillar7Center{
            self.Pillar7.center = newPillar7Center
        }
        if let newPillar8Center = Pillar8Center{
            self.Pillar8.center = newPillar8Center
        }
        if let newPillar9Center = Pillar9Center{
            self.Pillar9.center = newPillar9Center
        }
        
        if let newPillarTop1Center = PillarTop1Center{
            self.PillarTop1.center = newPillarTop1Center
        }
        if let newPillarTop2Center = PillarTop2Center{
            self.PillarTop2.center = newPillarTop2Center
        }
        if let newPillarTop3Center = PillarTop3Center{
            self.PillarTop3.center = newPillarTop3Center
        }
        if let newPillarTop4Center = PillarTop4Center{
            self.PillarTop4.center = newPillarTop4Center
        }
        if let newPillarTop5Center = PillarTop5Center{
            self.PillarTop5.center = newPillarTop5Center
        }
        if let newPillarTop6Center = PillarTop6Center{
            self.PillarTop6.center = newPillarTop6Center
        }
    }
    
    
    
    func sendToBack(image: UIImageView){
        GameView.sendSubviewToBack(image)
    }

    
    func gameOver(){
        TapsValid = false
        timer.invalidate()
        
    
        Retry.hidden = false
        ScoreBoard.hidden = false
        
        
        
        
        sendToBack(Pillar1)
        sendToBack(Pillar2)
        sendToBack(Pillar3)
        sendToBack(Pillar4)
        sendToBack(Pillar5)
        sendToBack(Pillar6)
        sendToBack(Pillar7)
        sendToBack(Pillar8)
        sendToBack(Pillar9)
        
    }
    
    

}

