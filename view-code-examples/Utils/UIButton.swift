//
//  UIButton.swift
//  view-code-examples
//
//  Created by Willian  Candido da Silva on 30/11/21.
//

import UIKit

extension UIButton{

    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }

}
