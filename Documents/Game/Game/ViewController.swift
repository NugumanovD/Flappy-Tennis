//
//  ViewController.swift
//  Game
//
//  Created by Nugumanov on 26.04.18.
//  Copyright © 2018 Nugumanov. All rights reserved.
//

import UIKit

enum Direction {
    case right
    case left
    case top
    case down
}

class ViewController: UIViewController {
    
    var bird: Bird!
    var rocket: Rocket!
    var rocket1: Rocket!
    var timer: Timer!
//    var rocketLeft: Rocket!
//    var rocketRight: Rocket!
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupScene()
        runTimer()
    }
    
    func setupScene() {
        bird = Bird.create()
        bird.add(to: view)
        rocket = .leftCreate()
        rocket1 = Rocket.rightCreate(on: view)
        rocket.add(to: view)
        rocket1.add(to: view)
    }
    
    func runTimer() {
     
        timer = Timer.scheduledTimer(withTimeInterval: 0.007, repeats: true, block: { _ in
            self.moveObject()
        })
    }
    
    func moveObject()  {
        bird.move()
        rocket.moveLeft()
        rocket.moveRight()
    }

}
    

