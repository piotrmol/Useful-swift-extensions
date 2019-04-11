//
//  CloseKeyboardExtension.swift
//  GISMO
//
//  Created by Piotr Mol on 27.11.2018.
//  Copyright © 2018 Piotr Mol. All rights reserved.
//

import Foundation

extension UIViewController
{
    func hideKeyboardWhenUserTapAround (){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
