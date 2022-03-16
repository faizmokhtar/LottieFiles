//
//  HomeViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit
import Combine

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with item: HomeItem)
}

class HomeViewController: UIViewController {
    
    // MARK: - Outlets

    private lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.tintColor = .App.primary
        view.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.register(HomeLoginCell.self, forCellWithReuseIdentifier: HomeLoginCell.reuseIdentifier)
        view.register(HomeFeaturedCell.self, forCellWithReuseIdentifier: HomeFeaturedCell.reuseIdentifier)
        view.register(HomePeopleCell.self, forCellWithReuseIdentifier: HomePeopleCell.reuseIdentifier)
        view.register(HomeBlogCell.self, forCellWithReuseIdentifier: HomeBlogCell.reuseIdentifier)
        view.register(HomeSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeSectionHeader.reuseIdentifier)
        view.addSubview(refreshControl)
        return view
    }()
        
    var dataSource: UICollectionViewDiffableDataSource<Section, HomeItem>?
    
    private var cancellables = Set<AnyCancellable>()

    private let viewModel: HomeViewModel
    
    // MARK: - Inits

    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        createDataSource()
        viewModel.fetchSections()
    }
    
    @objc func didPullToRefresh() {
        refreshControl.beginRefreshing()
        viewModel.fetchSections()
    }
}

extension HomeViewController {
    private func setupUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBindings() {
        viewModel.$sections
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.refreshControl.endRefreshing()
                self?.reloadData()
            })
            .store(in: &cancellables)
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, HomeItem>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let sectionIdentifier = self.dataSource?.snapshot().sectionIdentifier(containingItem: item) else {
                return nil
            }
            
            switch sectionIdentifier.type {
            case .login:
                return self.configure(HomeLoginCell.self, with: item, for: indexPath)
            case .featured:
                return self.configure(HomeFeaturedCell.self, with: item, for: indexPath)
            case .people:
                let cell = self.configure(HomePeopleCell.self, with: item, for: indexPath)
                return cell
            case .blog:
                return self.configure(HomeBlogCell.self, with: item, for: indexPath)
            }
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeSectionHeader.reuseIdentifier, for: indexPath) as? HomeSectionHeader else { return nil }
            
            guard let item = self?.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: item) else { return nil }
            sectionHeader.titleLabel.text = section.title
            return sectionHeader
        }
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, HomeItem>()
        snapshot.appendSections(viewModel.sections)
        
        for section in viewModel.sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
    
    private func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with item: HomeItem, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("unable to dequeue \(cellType)")
        }
        cell.configure(with: item)
        return cell

    }
    
    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.333),
                heightDimension: .fractionalHeight(1.0)))

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.2)),
            subitem: item,
            count: 3)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = self.viewModel.sections[sectionIndex]
            
            switch section.type {
            case .login:
                return self.makeLoginSection()
            case .featured:
                return self.makeFeaturedSection()
            case .people:
                return self.makePeopleSection()
            case .blog:
                return self.makeBlogSection(layoutEnvironment: layoutEnvironment)
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }
    
    private func makeLoginSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(150))
        let layoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: layoutGroupSize, subitems: [layoutItem])
        let section = NSCollectionLayoutSection(group: layoutGroup)
        return section
    }
    
    private func makeFeaturedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(400))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 5)
        let layoutGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .estimated(1))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let section = NSCollectionLayoutSection(group: layoutGroup)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        let layoutSectionHeader = makeHeaderSection()
        section.boundarySupplementaryItems = [layoutSectionHeader]
        return section
    }
    
    private func makePeopleSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.33)
        )
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let layoutGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .fractionalWidth(0.55)
        )
        let layoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: layoutGroupSize, subitems: [layoutItem])

        let section = NSCollectionLayoutSection(group: layoutGroup)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        let layoutSectionHeader = makeHeaderSection()
        section.boundarySupplementaryItems = [layoutSectionHeader]
        return section
    }
    
    private func makeBlogSection(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        let list = NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
        return list
    }
    
    private func makeHeaderSection() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(80)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        return layoutSectionHeader
    }
}
