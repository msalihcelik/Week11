//
//  ViewController.swift
//  Week11
//
//  Created by Mehmet Salih ÇELİK on 14.12.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    let welcomeView = WelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func configureContents() {
        view.backgroundColor = .yellow
        view.addSubview(welcomeView)
        welcomeView.backgroundColor = .yellow
        welcomeView.delagate = self
        welcomeView.translatesAutoresizingMaskIntoConstraints = false
        welcomeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        welcomeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        welcomeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        welcomeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func setupView() {
        let log = UserDefaults.standard.object(forKey: "Logged")
        if log != nil {
            let label = UILabel()
            view.addSubview(label)
            view.backgroundColor = .systemBrown
            label.text = "Not first run"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.backgroundColor = .clear
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        } else {
            configureContents()
            UserDefaults.standard.set(true, forKey: "Logged")
        }
    }
}

// MARK: - WelcomeViewDelegate
extension ViewController: WelcomeViewDelegate {
    
    func didTapButton(random: Int) {
        print(random)
    }
}
