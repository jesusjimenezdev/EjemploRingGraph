//
//  ViewController.swift
//  RingGraph
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ringGraph: RingGraphView!
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ringGraph.progress = CGFloat(slider.value)
        
    }
    
    @IBAction func sliderDidChange(_ sender: UISlider) {
        
        ringGraph.progress = CGFloat(sender.value)
        
    }
    
}

