//
//  viewCorners.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 02/05/2021.
//

import UIKit

class HalfViewCorners: UIView {

   override func layoutSubviews() {
           super.layoutSubviews()
       self.layer.cornerRadius = bounds.height / 2
       self.layer.masksToBounds = true

   }
}
