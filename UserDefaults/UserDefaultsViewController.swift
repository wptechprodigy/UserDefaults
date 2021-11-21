//
//  UserDefaultsViewController.swift
//  UserDefaults
//
//  Created by waheedCodes on 14/11/2021.
//

import UIKit

protocol UserDefaultsProtocol {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
}

extension UserDefaults: UserDefaultsProtocol {}

class UserDefaultsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private(set) var counterLabel: UILabel!
    @IBOutlet private(set) var incrementButton: UIButton!
    
    var userDefault: UserDefaultsProtocol = UserDefaults.standard
    private var count = 0 {
        didSet {
            counterLabel.text = "\(count)"
            userDefault.set(count, forKey: "count")
        }
    }
    
    // MARK: - Object Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = userDefault.integer(forKey: "count")
    }
    
    // MARK: - Actions
    
    @IBAction private func incrementButtonTapped() {
        count += 1
    }
}
