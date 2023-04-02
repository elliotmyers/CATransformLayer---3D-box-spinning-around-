//
//  ViewController.swift
//  CATransformLayer
//
//  Created by Raiden Yamato on 02.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func face(with transform: CATransform3D, color: UIColor) -> CALayer {
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        face.backgroundColor = color.cgColor
        face.transform = transform
        return face
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        view.backgroundColor = .black

           let cube = CATransformLayer()

           // create the front face
           let transform1 = CATransform3DMakeTranslation(0, 0, 50)
           cube.addSublayer(face(with: transform1, color: .red))

           // create the right-hand face
           var transform2 = CATransform3DMakeTranslation(50, 0, 0)
           transform2 = CATransform3DRotate(transform2, CGFloat.pi / 2, 0, 1, 0)
           cube.addSublayer(face(with: transform2, color: .yellow))

           // create the top face
           var transform3 = CATransform3DMakeTranslation(0, -50, 0)
           transform3 = CATransform3DRotate(transform3, CGFloat.pi / 2, 1, 0, 0)
           cube.addSublayer(face(with: transform3, color: .green))

           // create the bottom face
           var transform4 = CATransform3DMakeTranslation(0, 50, 0)
           transform4 = CATransform3DRotate(transform4, -(CGFloat.pi / 2), 1, 0, 0)
           cube.addSublayer(face(with: transform4, color: .white))

           // create the left-hand face
           var transform5 = CATransform3DMakeTranslation(-50, 0, 0)
           transform5 = CATransform3DRotate(transform5, -(CGFloat.pi / 2), 0, 1, 0)
           cube.addSublayer(face(with: transform5, color: .cyan))

           // create the back face
           var transform6 = CATransform3DMakeTranslation(0, 0, -50)
           transform6 = CATransform3DRotate(transform6, CGFloat.pi, 0, 1, 0)
           cube.addSublayer(face(with: transform6, color: .magenta))

           // now position the transform layer in the center
           cube.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)

           // and add the cube to our main view's layer
           view.layer.addSublayer(cube)
        
        let anim = CABasicAnimation(keyPath: "transform")
        anim.fromValue = cube.transform
        anim.toValue = CATransform3DMakeRotation(CGFloat.pi, 1, 1, 1)
        anim.duration = 2
        anim.isCumulative = true
        anim.repeatCount = .greatestFiniteMagnitude
        cube.add(anim, forKey: "transform")
        
        
    }
    
}

