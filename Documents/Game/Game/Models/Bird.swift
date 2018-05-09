//
//  File.swift
//  Game
//
//  Created by Nugumanov on 26.04.18.
//  Copyright © 2018 Nugumanov. All rights reserved.
//

import UIKit


class Bird: UIImageView {
//    var rocketLeft: Rocket!
//    var rocketRight: Rocket!
    var direction: Direction = .right
    
    var rightSideX: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    var leftSideX: CGFloat {
         return self.frame.origin.x
    }
    
    
    static func create() -> Bird {
        let rect = CGRect(x: 150, y: 150, width: 50, height: 50)
        let bird = Bird(frame: rect)
        
        var images: [UIImage] = []
        for i in 1...3 {
            let image = UIImage(named: "\(i)")!
            images.append(image)
        }
        
        bird.animationImages = images
        bird.animationDuration = 0.3
        bird.animationRepeatCount = -1
        bird.contentMode = .scaleAspectFit
        bird.startAnimating()
        return bird
        
    }
    
    func add(to view: UIView) {
        view.addSubview(self)
    }
    
    func move()  {
        let view = superview!
        
        if direction == .right && rightSideX < view.frame.size.width {
            frame.origin.x += 1
            if rightSideX >= view.frame.size.width || isIntersectionObject(firstView: self, secondView: rocketRight )   {
                direction = .left
            }
            transform = CGAffineTransform(scaleX: 1, y: 1)
        } else {
            frame.origin.x -= 1
            if leftSideX <= 0 || isIntersectionObject(firstView: self, secondView: rocketLeft){
                direction = .right
            }
            transform = CGAffineTransform(scaleX: -1, y: 1)
        
        }
    
    }
    
    
    
        func isIntersectionObject(firstView: UIView ,secondView: UIView) -> Bool {
            return firstView.frame.intersects(secondView.frame)
          }
}
