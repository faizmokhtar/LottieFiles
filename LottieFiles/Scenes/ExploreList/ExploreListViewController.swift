//
//  ExploreListViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 10/03/2022.
//

import UIKit
import Combine

class ExploreListViewController: UIViewController {

    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.delegate = self
        view.register(ExploreCell.self, forCellReuseIdentifier: ExploreCell.reuseIdentifier)
        return view
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let viewModel: ExploreListViewModel
    
    // MARK: - Inits

    init(viewModel: ExploreListViewModel) {
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
}

// MARK: - Private Methods

extension ExploreListViewController {
    private func setupBindings() {
        viewModel.$cellViewModels
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in self?.tableView.reloadData() }
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

extension ExploreListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExploreCell.reuseIdentifier, for: indexPath) as! ExploreCell
        let viewModel = viewModel.cellViewModels[indexPath.row]
        cell.setup(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableView Delegates

extension ExploreListViewController: UITableViewDelegate {}
