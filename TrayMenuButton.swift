//
//  TrayMenuButtonView.swift
//  Prioritize
//
//  Created by Mikołaj Stępniewski on 17.09.2017.
//  Copyright © 2017 Mikołaj Stępniewski. All rights reserved.
//

import UIKit

class TrayMenuButton:UIButton {
    var buttonDescription: String
    
   
    required init(image:UIImage, description:String) {
        self.buttonDescription = description
        super.init(frame: .zero)
        self.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}