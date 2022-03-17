//
//  AnimationShareViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 17/03/2022.
//

import UIKit

class AnimationShareViewController: UIViewController {

    private let shareInstagramStoriesButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.addTarget(self, action: #selector(didTappedShareInstagramStoriesButton), for: .touchUpInside)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Share Animation"
        setupUI()
    }
    
    @objc func didTappedShareInstagramStoriesButton() {
        guard let url = viewModel.videoURL else { return }
        URLSession.shared.downloadTask(with: url) { [weak self] localURL, response, error in
            DispatchQueue.main.async {
                try? self?.postVideo(url: localURL)
            }
        }.resume()
    }
    
    private func postVideo(url: URL?)  throws {
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

extension AnimationShareViewController {
    private func setupUI() {
        view.addSubview(shareInstagramStoriesButton)
        
        NSLayoutConstraint.activate([
            shareInstagramStoriesButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            shareInstagramStoriesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareInstagramStoriesButton.heightAnchor.constraint(equalToConstant: 50),
            shareInstagramStoriesButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
