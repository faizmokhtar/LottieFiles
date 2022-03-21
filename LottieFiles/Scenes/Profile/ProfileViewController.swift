//
//  ProfileViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit
import Combine

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .App.primary
        view.layer.cornerRadius = 15
        view.layer.cornerCurve = .continuous
        view.addTarget(self, action: #selector(didTappedLoginButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .white
        view.hidesWhenStopped = true
        return view
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    private var isLoggedIn: Bool = false

    // MARK: - Inits
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel = ProfileViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
}

// MARK: - Actions

extension ProfileViewController {
    @objc private func didTappedLoginButton() {
        if isLoggedIn {
            viewModel.logout()
        } else {
            viewModel.login(email: "mfmokhtar@gmail.com", password: "welottieyou")
        }
    }
}

// MARK: - Private Methods

extension ProfileViewController {
    private func setupUI() {
        view.addSubview(loginButton)
        loginButton.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor)
        ])
    }
    
    private func setupBindings() {
        viewModel.isUserLoggedIn
            .sink { [weak self] isUserLoggedIn in
                let title = isUserLoggedIn ? "Log out" : "Log in"
                self?.loginButton.setTitle(title, for: .normal)
            }
            .store(in: &cancellables)
        
        viewModel.isUserLoggedIn
            .assign(to: \.isLoggedIn, on: self)
            .store(in: &cancellables)
        
        viewModel.$isLoading
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.loginButton.isUserInteractionEnabled = false
                    self?.loginButton.titleLabel?.layer.opacity = 0
                    self?.loadingIndicator.startAnimating()
                } else {
                    self?.loginButton.isUserInteractionEnabled = true
                    self?.loginButton.titleLabel?.layer.opacity = 1
                    self?.loadingIndicator.stopAnimating()
                }
            }
            .store(in: &cancellables)
    }
}
