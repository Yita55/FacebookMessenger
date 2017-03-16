//
//  Extensions.swift
//  FacebookMessenger
//
//  Created by James Rochabrun on 3/15/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

//MARK: STRING EXTENSIONS

extension String {
    
    func estimatedSizeBasedOn(width: CGFloat, and font: UIFont) -> CGSize {
        
        let size = CGSize(width: width, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: self).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: font], context: nil)
        return CGSize(width: estimatedFrame.width, height: estimatedFrame.height + 20)
    }
}


