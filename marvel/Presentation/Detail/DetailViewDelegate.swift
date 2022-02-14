//
//  DetailViewDelegate.swift
//  marvel
//
//  Created by jvictorio on 14/2/22.
//

import Foundation
import UIKit

protocol DetailViewDelegate: AnyObject{
    func setupView()
    
    func success()
    func failure(error: String)
    
    func showData(name: String, image: UIImage)
}
