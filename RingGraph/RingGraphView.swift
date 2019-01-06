//
//  RingGraphView.swift
//  RingGraph
//
//

import UIKit

class RingGraphView: UIView {
    
    var progress: CGFloat = CGFloat(0.5) {
        
        didSet {
            
            if progress >= 1.0 {
                
                progress = 1.0
                
            }
            else if progress <= 0.0 {
                
                progress = 0.0
                
            }
            
            ringLayer.strokeEnd = progress
            
        }
        
    }
    
    let backdropLayer: CAShapeLayer = CAShapeLayer()
    
    let ringWidth: CGFloat = CGFloat(40.0)
    
    var halfRingWidth: CGFloat {
        
        return ringWidth / 2
        
    }
    
    let ringLayer: CAShapeLayer = CAShapeLayer()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        let circlePath: CGPath = UIBezierPath(ovalIn: CGRect(x: halfRingWidth, y: halfRingWidth, width: bounds.width - ringWidth, height: bounds.height - ringWidth)).cgPath
        
        let offSet = CGFloat(90 * Double.pi / 180)
        
        backdropLayer.path = circlePath
        
        backdropLayer.lineWidth = ringWidth
        
        backdropLayer.strokeEnd = 1.0
        
        backdropLayer.fillColor = nil
        
        backdropLayer.strokeColor = UIColor(red: 112/255, green: 25/255, blue: 18/255, alpha: 1.0).cgColor
        
        layer.addSublayer(backdropLayer)
        
        ringLayer.path = circlePath
        
        ringLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        
        ringLayer.lineWidth = ringWidth
        
        ringLayer.strokeColor = UIColor.black.cgColor
        
        ringLayer.fillColor = nil
        
        ringLayer.strokeEnd = 0.5
        
        ringLayer.lineCap = CAShapeLayerLineCap.round
        
        ringLayer.transform = CATransform3DMakeRotation(offSet, 0, 0, -1.0)
        
        //layer.addSublayer(ringLayer)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [UIColor(red: 231/255, green: 51/255, blue: 38/255, alpha: 1.0).cgColor, UIColor(red: 248/255, green: 255/255, blue: 174/255, alpha: 1.0).cgColor]
        
        gradientLayer.frame = bounds
        
        gradientLayer.locations = [0.0, 1.0]
        
        gradientLayer.mask = ringLayer
        
        layer.addSublayer(gradientLayer)
        
    }

}
