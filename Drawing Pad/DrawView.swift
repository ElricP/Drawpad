//
//  DrawView.swift
//  Drawing Pad
//
//  Created by Elric Y P on 2018-02-13.
//  Copyright © 2018 Elric Y P. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var Lines = [Line]()
    var lastPoint: CGPoint?
    var chosenColor : CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let newPoint = touch.location(in: self)
            Lines.append(Line(start: lastPoint!, end: newPoint))
            lastPoint = newPoint
        }
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        for Line in Lines {
            context?.move(to: CGPoint(x: Line.start.x, y: Line.start.y))
            context?.addLine(to: CGPoint(x: Line.end.x, y: Line.end.y))
        }
        context?.setLineCap(CGLineCap.round)
        
        context?.setStrokeColor(chosenColor)
        //context?.setFillColor(red: 1.0, green: 0, blue: 255.0, alpha: 1.0)
        context?.strokePath()
        UIGraphicsEndImageContext()
    }
    
    
    
    
}
