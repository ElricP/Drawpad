//
//  ViewController.swift
//  Drawing Pad
//
//  Created by Elric Y P on 2018-02-13.
//  Copyright © 2018 Elric Y P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var drawView: UIImageView!
    var Lines = [Line]()
    var lastPoint: CGPoint?
    var chosenColor : CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        drawView.image = nil
    }
    
    @IBAction func colorButtonPressed(_ sender: UIButton) {
        if sender.backgroundColor != nil {
            chosenColor = sender.backgroundColor!.cgColor
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let newPoint = touch.location(in: self.view)
            Lines.append(Line(start: lastPoint!, end: newPoint))
            lastPoint = newPoint
        }
        draw()
    }
    
    func draw() {
        UIGraphicsBeginImageContext(self.view.bounds.size)
        drawView.image?.draw(in: self.view.bounds)//CGRect(x: 0, y: 0, width: self.view.boundary.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        let line = Lines.last!
            context?.move(to: CGPoint(x: line.start.x, y: line.start.y))
            context?.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
        
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(30)
        context?.setStrokeColor(chosenColor)
        context?.strokePath()
        drawView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clearTapped(){
        
    }
    
}

