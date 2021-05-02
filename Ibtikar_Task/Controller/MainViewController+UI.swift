//
//  +UI.swift
//  Ibtikar_Task
//
//  Created by mohamed samir on 01/05/2021.
//

import Foundation
import  UIKit



extension MainViewController {
    func initActivityIndicator(){
        activityIndicator = UIActivityIndicatorView()
        activityIndicator?.center = self.view.center
        activityIndicator?.hidesWhenStopped = true
        activityIndicator?.style = UIActivityIndicatorView.Style.whiteLarge
        view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
    }
}


