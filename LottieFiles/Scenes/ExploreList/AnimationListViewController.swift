//
//  AnimationListViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 10/03/2022.
//

import UIKit
import Combine

class AnimationListViewController: UIViewController {

    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        view.register(AnimationCell.self, forCellReuseIdentifier: AnimationCell.reuseIdentifier)
        view.addSubview(refreshControl)
        return view
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.tintColor = .App.primary
        view.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        return view
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let viewModel: AnimationListViewModel
    
    // MARK: - Inits

    init(viewModel: AnimationListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
        viewModel.fetchList()
    }

    @objc func didPullToRefresh() {
        self.refreshControl.beginRefreshing()
        viewModel.fetchList()
    }
}

// MARK: - Private Methods

extension AnimationListViewController {
    private func setupBindings() {
        viewModel.$cellViewModels
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.refreshControl.endRefreshing()
                self?.tableView.reloadData()
            })
            .store(in: &cancellables)
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableView Data Source

extension AnimationListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimationCell.reuseIdentifier, for: indexPath) as! AnimationCell
        let viewModel = viewModel.cellViewModels[indexPath.row]
        cell.setup(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableView Delegates

extension AnimationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.cellViewModels[indexPath.row]
        let viewModel = AnimationDetailViewModel(
            url: model.lottieURL)
        let viewController = AnimationDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
