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
        label.text = "Crypto Track"
        label.font = .robotBold20()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .darkGray
        view.alpha = 0.4
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cryptoLabel: UILabel = {
        let label = UILabel()
        label.text = "BTC"
        label.font = .robotBold20()
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = .robotBold20()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
         label.text = "USD"
         label.textColor = .white
         label.font = .robotBold20()
         label.textAlignment = .right
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    private let curencysPicker: UIPickerView = {
       let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
//    override func viewDidLayoutSubviews() {
//        backgroundView.layer.cornerRadius = backgroundView.frame.width / 2
//    }
    
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackgroundColor
        view.addSubview(backgroundView)
        stackView = UIStackView(arrangedSubviews: [cryptoLabel, priceLabel, currencyLabel], axis: .horizontal, spacing: 80)
        stackView.contentMode = .scaleAspectFill
        view.addSubview(stackView)
    }
    
    
    
}

//MARK: - Setup Constraints

extension MainViewController {
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            backgroundView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        ])
        
        
    }
    
    
}
