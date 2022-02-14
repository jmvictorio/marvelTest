//
//  HomeViewDelegate.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation

protocol HomeViewDelegate: AnyObject{
    func setupView()
    
    func success()
    func failure(error: String)
    
    func showLoading()
    func hideLoading()
}
