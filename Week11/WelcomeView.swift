//
//  WelcomeView.swift
//  Week11
//
//  Created by Mehmet Salih ÇELİK on 14.12.2021.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func didTapButton(random: Int)
}

public class WelcomeView: UIView {
    
    weak var delagate: WelcomeViewDelegate?
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome the Week11"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.setTitle("Button", for: .normal)
        button.layer.cornerRadius = 50
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.backgroundColor = UIColor.systemGray4.cgColor
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc
    func buttonTapped() {
        delagate?.didTapButton(random: Int.random(in: 1...35))
    }
}
