//
//  FakeUserDefaults.swift
//  UserDefaultsTests
//
//  Created by waheedCodes on 14/11/2021.
//

@testable import UserDefaults

class FakeUserDefaults: UserDefaultsProtocol {
    var integers: [String: Int] = [:]
    
    func set(_ value: Int, forKey defaultName: String) {
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        integers[defaultName] ?? 0
    }
}
