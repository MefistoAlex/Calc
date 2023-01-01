//
//  LCDDisplay.swift
//  Calc
//
//  Created by Alexandr Mefisto on 01.01.2023.
//

import UIKit

class LCDDisplay: UIView {
    
    //MARK: - IBOutlets
    
    @IBOutlet var label: UILabel!
    
    // MARK: - Initialisers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    private func sharedInit() {
        
    }
}
