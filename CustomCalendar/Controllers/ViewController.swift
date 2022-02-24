//
//  ViewController.swift
//  Calander
//
//  Created by Apptunix on 24/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calanderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCalanderView()
    }
    
    fileprivate func loadCalanderView() {
        if let nib = Bundle.main.loadNibNamed("CustomCalanderView", owner: self),
           let nibView = nib.first as? UIView {
            calanderView.addSubview(nibView)
        }
    }
    
}

