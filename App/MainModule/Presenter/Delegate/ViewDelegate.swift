//
//  ViewDelegate.swift
//  App
//
//  Created by Владимир on 07.05.2022.
//

import Foundation

protocol MainViewProtocol : AnyObject {
    func success()
    func failure(error : Error)
}
