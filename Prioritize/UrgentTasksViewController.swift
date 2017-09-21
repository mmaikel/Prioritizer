//
//  AimsDetailsViewController.swift
//  Prioritize
//
//  Created by Mikołaj Stępniewski on 06.09.2017.
//  Copyright © 2017 Mikołaj Stępniewski. All rights reserved.
//

import UIKit

class UrgentTasksViewController: UIViewController {
    @IBAction func handleDissmisButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var trayMenuView: UIView!
    
    @IBOutlet weak var label: UILabel!
    weak var trayMenuViewController:TrayMenuViewController!
    private var dimView:DimView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.masksToBounds = true
        
        
        // Dim View
        
        dimView = DimView(in: self.view, forTrayView: trayMenuView, withStyle: .bottom)
        trayMenuViewController.dimView = dimView
        dimView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(respondToDimViewTap(sender:))))
        
        
        trayMenuViewController.setUpView(trayOpenedHeight: 200, superview: trayMenuView, trayClosedHeight: 80, style: .bottom)
        
        let btn5 = TrayMenuButton(image: #imageLiteral(resourceName: "image"), description: "Images")
        let btn6 = TrayMenuButton(image: #imageLiteral(resourceName: "lens"), description: "Camera")
        let btn7 = TrayMenuButton(image: #imageLiteral(resourceName: "bitcoin"), description: "Wallet")
        let btn8 = TrayMenuButton(image: #imageLiteral(resourceName: "profile"), description: "Profile")
        
        trayMenuViewController.setUpContainer(insets: UIEdgeInsets(top: 20, left: 30, bottom: 25, right: 30), itemsPerRow: 4)
        trayMenuViewController.addControls(controls: [btn5, btn6, btn7, btn8])
        
        
    }
    
    deinit {
        print("💾 UrgentTasksViewController deinitialized...")
    }
    
    
    
    // ⚡️ FUNCTIONS
    
    
    
    @objc func respondToDimViewTap(sender:UITapGestureRecognizer) {
        trayMenuViewController.use()
    }
    
    public func  makeViewsVisibleAgainstBackground(color:UIColor) {
        let contrastColor = color.contrastColor()
        label.textColor = contrastColor
        trayMenuViewController.tintStyle = contrastColor == .white ? .light : .normal
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TrayMenuViewController {
            trayMenuViewController = vc
            trayMenuViewController.delegate = self
            return
        }
    }

}

extension UrgentTasksViewController:TrayMenuDelegate {
    func updateLayout() {
        view.layoutIfNeeded()
    }
}
