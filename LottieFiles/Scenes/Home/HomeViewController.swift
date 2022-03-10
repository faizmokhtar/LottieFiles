//
//  HomeViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 09/03/2022.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseIdentifier: String { get }
    func configure(with item: HomeItem)
}

enum Section: Hashable {
    case login
    case featured
    case people
    case blog
}

typealias HomeLayoutSectionTuple = (section: Section, item: [HomeItem])

struct HomeItem: Hashable, Equatable {
    let id = UUID()
    
    static func == (lhs: HomeItem, rhs: HomeItem) -> Bool {
        lhs.id == rhs.id
    }
}

class HomeViewController: UIViewController {
    
    // MARK: - Outlets

    private lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        view.tintColor = .red
        view.addTarget(self, action: #selector(didRefreshControl), for: .valueChanged)
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
    
    let store: [HomeLayoutSectionTuple] = [
        (.login, [HomeItem()]),
        (.featured, [HomeItem(), HomeItem()]),
        (.blog, [HomeItem(), HomeItem(), HomeItem()]),
        (.people, [HomeItem(), HomeItem(), HomeItem(), HomeItem(), HomeItem(), HomeItem()])
    ]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, HomeItem>?
    
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
        createDataSource()
        reloadData()
    }
    
    @objc func didRefreshControl() {}
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
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, HomeItem>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let sectionIdentifier = self.dataSource?.snapshot().sectionIdentifier(containingItem: item) else {
                return nil
            }

            switch sectionIdentifier {
            case .login:
                return self.configure(HomeLoginCell.self, with: item, for: indexPath)
            case .featured:
                return self.configure(HomeFeaturedCell.self, with: item, for: indexPath)
            case .people:
                return self.configure(HomePeopleCell.self, with: item, for: indexPath)
            case .blog:
                return self.configure(HomeBlogCell.self, with: item, for: indexPath)
            }
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeSectionHeader.reuseIdentifier, for: indexPath) as? HomeSectionHeader else { return nil }
            
            guard let item = self?.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: item) else { return nil }
            sectionHeader.titleLabel.text = "Test"
            return sectionHeader
        }
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, HomeItem>()
        store.forEach { layout in
            snapshot.appendSections([layout.section])
            snapshot.appendItems(layout.item, toSection: layout.section)
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
            let store = self.store[sectionIndex]
            
            switch store.section {
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
