//
//  Rocket.swift
//  Game
//
//  Created by Nugumanov on 26.04.18.
//  Copyright © 2018 Nugumanov. All rights reserved.
//

import UIKit

var rocketLeft: Rocket!
var rocketRight: Rocket!

class Rocket: UIView {
    
    var movingDirectionRocketRight: Direction = .down
    var movingDirectionRocketLeft: Direction = .top     
    
    var topSideY: CGFloat {
        return self.frame.origin.y
    }
    var downSideY: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    static func leftCreate() -> Rocket {
        let square = CGRect(x: 1, y: 100, width: 10, height: 80)
        rocketLeft = Rocket(frame: square)
    
        rocketLeft.backgroundColor = .red
    
        return rocketLeft
    }
    
    static func rightCreate(on view: UIView) -> Rocket {
        let width = CGFloat(10)
        let square2 = CGRect(x: view.frame.width - width, y: 50, width: width, height: 80)
        rocketRight = Rocket(frame: square2)
        rocketRight.backgroundColor = .green
        return rocketRight
    }
    
    func add(to view: UIView) {
//        view.addSubview(self)
        view.addSubview(self)
    }
    
    func moveLeft() {
        let view = superview!
        
        if movingDirectionRocketLeft == .top && rocketLeft.downSideY < view.frame.size.height {
            frame.origin.y += 1
            if rocketLeft.downSideY >= view.frame.height {
                movingDirectionRocketLeft = .down
            }
        } else {
            frame.origin.y -= 1
            if rocketLeft.topSideY <= 0 {
                movingDirectionRocketLeft = .top
            }
        }
    }
    
    
    func moveRight() {
        let view1 = superview!
        
       if movingDirectionRocketRight == .top && rocketRight.downSideY < view1.frame.size.height {
            rocketRight.frame.origin.y += 1
            if rocketRight.downSideY >= view1.frame.height {
                movingDirectionRocketRight = .down
            }
            
        } else {
            rocketRight.frame.origin.y -= 1
            if rocketRight.topSideY <= 0 {
                movingDirectionRocketRight = .top
            }
        }
    }
    
    
    
    
}
