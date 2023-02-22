//
//  ViewController.swift
//  MyCrypto_Project
//
//  Created by Aleksandr Kan on 23/02/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Crypto Currency"
        label.font = .robotBold20()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackgroundColor
    }
    
    private func setupConstraints() {
        
    }
    
}

