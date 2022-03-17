//
//  AnimationShareViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 17/03/2022.
//

import UIKit

class AnimationShareViewController: UIViewController {

    // MARK: - Outlets

    private lazy var shareInstagramStoriesButton: ShareButton = {
        let view = ShareButton(
            iconImage: UIImage(systemName: "camera.circle.fill"),
            title: "Share on Instagram Stories",
            detail: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTappedShareInstagramStoriesButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var shareAsJSONButton: ShareButton = {
        let view = ShareButton(
            iconImage: UIImage(systemName: "doc.circle.fill"),
            title: "Share as JSON file",
            detail: ".json")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTappedShareJSONButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var shareAsAnimatedGIFButton: ShareButton = {
        let view = ShareButton(
            iconImage: UIImage(systemName: "doc.circle.fill"),
            title: "Share as animated GIF",
            detail: ".gif")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTappedAnimatedGIFButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var shareAsVideoButton: ShareButton = {
        let view = ShareButton(
            iconImage: UIImage(systemName: "doc.circle.fill"),
            title: "Share as Video MP4",
            detail: ".mp4")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTappedVideoButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints =  false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 5
        return view
    }()
    
    private lazy var closeButton: UIBarButtonItem = {
        let view = UIBarButtonItem(
            image: UIImage(systemName: "xmark.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(didTappedCloseButton))
        view.tintColor = .App.primary
        return view
    }()

    // MARK: - Inits

    private let viewModel: AnimationViewModel
    
    init(viewModel: AnimationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Share Animation"
        navigationItem.leftBarButtonItem = closeButton
        setupUI()
    }
}

// MARK: - Actions

extension AnimationShareViewController {
    @objc func didTappedShareInstagramStoriesButton() {
        guard let url = viewModel.videoURL else { return }
        URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
            DispatchQueue.main.async {
                try? self?.shareVideoInInstagramStories(url: localURL)
            }
        }.resume()
    }
    
    @objc func didTappedShareJSONButton() {
        guard let url = viewModel.lottieURL else { return }
        shareInActivity(text: viewModel.name, url: url)
    }
    
    @objc func didTappedAnimatedGIFButton() {
        guard let url = viewModel.gifURL else { return }
        shareInActivity(text: viewModel.name, url: url)
    }
    
    @objc func didTappedVideoButton() {
        guard let url = viewModel.videoURL else { return }
        shareInActivity(text: viewModel.name, url: url)
    }
    
    @objc func didTappedCloseButton() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Private Methods

extension AnimationShareViewController {
    private func setupUI() {
        view.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(shareInstagramStoriesButton)
        buttonStackView.addArrangedSubview(shareAsJSONButton)
        buttonStackView.addArrangedSubview(shareAsAnimatedGIFButton)
        buttonStackView.addArrangedSubview(shareAsVideoButton)
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
    private func shareInActivity(text: String, url: URL) {
        let activityViewController = UIActivityViewController(
            activityItems: [text, url],
            applicationActivities:nil)
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    private func shareVideoInInstagramStories(url: URL?)  throws {
        guard let url = url else { return }
        let data = try Data(contentsOf: url)
        
        guard let urlScheme = URL(string: "instagram-stories://share") else { return }
        
        if UIApplication.shared.canOpenURL(urlScheme) {
            let items = [["com.instagram.sharedSticker.backgroundVideo": data]]
            let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60*5)]
            UIPasteboard.general.setItems(items, options: pasteboardOptions)
            UIApplication.shared.open(urlScheme, options: [:], completionHandler: nil)
        }
    }
}
