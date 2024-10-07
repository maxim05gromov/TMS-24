//
//  City.swift
//  HW24
//
//  Created by Максим Громов on 23.09.2024.
//

import Foundation

struct City : Identifiable {
    var id: UUID = .init()
    var name: String
    var timeZone: Int
}   
