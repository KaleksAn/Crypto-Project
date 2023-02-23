//
//  ViewController.swift
//  MyCrypto_Project
//
//  Created by Aleksandr Kan on 23/02/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let dataManager = Datamanager()
    private var coinModel = Coin()
    
    private var criptoIndex = 0
    private var currencyIndex = 0
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Crypto Track"
        label.font = .robotoBold48()
        label.textColor = .darkGray
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
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
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
        setupDelegates()
        setupDelegates()
        let _ = dataManager.getModel(for: coinModel.assets[1][criptoIndex],
                                     and: coinModel.assets[0][currencyIndex])
    }

    private func setupViews() {
        view.backgroundColor = .specialBackgroundColor
        view.addSubview(nameLabel)
        view.addSubview(backgroundView)
        stackView = UIStackView(arrangedSubviews: [cryptoLabel, priceLabel, currencyLabel], axis: .horizontal, spacing: 50)
        stackView.contentMode = .scaleAspectFill
        view.addSubview(stackView)
        view.addSubview(curencysPicker)
    }
    
    private func setupDelegates() {
        curencysPicker.delegate = self
        curencysPicker.dataSource = self
        dataManager.delegate = self
    }
   
}

//MARK: - Setup Constraints

extension MainViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            curencysPicker.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 100),
            curencysPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            curencysPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
    }
}

//MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension MainViewController: UIPickerViewDelegate {
    
}

extension MainViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        coinModel.assets.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return coinModel.assets[1].count
        case 1:
            return coinModel.assets[0].count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return coinModel.assets[1][row]
        case 1:
            return coinModel.assets[0][row]
        default:
            return "None"

        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            criptoIndex = row
            let _ = dataManager.getModel(for: coinModel.assets[1][criptoIndex],
                                         and: coinModel.assets[0][currencyIndex])
            
        case 1:
            currencyIndex = row
            let _ = dataManager.getModel(for: coinModel.assets[1][criptoIndex],
                                         and: coinModel.assets[0][currencyIndex])
        default:
            break
        }
    }
    
}
    
//MARK: - Set CoinManagerDelegate

extension MainViewController: CoinManagerDelegate {
    
    func updateValues(manager: Datamanager, coin: Coin) {
        coinModel = coin
        cryptoLabel.text = coinModel.crypto
        currencyLabel.text = coinModel.currency
        priceLabel.text = numberFormat(number: coinModel.rate)
    }
    
    private func numberFormat(number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: number as NSNumber) ?? "0"
    }
    
}



