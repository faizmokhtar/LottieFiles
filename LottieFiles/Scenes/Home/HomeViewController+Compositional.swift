//
//  HomeViewController+Compositional.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import UIKit

// MARK: - HomeViewController compositional layout configuration

extension HomeViewController {
    func makeCollectionViewLayout() -> UICollectionViewLayout {
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
    
    func makeLoginSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(110))
        let layoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: layoutGroupSize, subitems: [layoutItem])
        let section = NSCollectionLayoutSection(group: layoutGroup)
        return section
    }
    
    func makeFeaturedSection() -> NSCollectionLayoutSection {
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
    
    func makePeopleSection() -> NSCollectionLayoutSection {
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
    
    func makeBlogSection(layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        let list = NSCollectionLayoutSection.list(using: listConfiguration, layoutEnvironment: layoutEnvironment)
        return list
    }
    
    func makeHeaderSection() -> NSCollectionLayoutBoundarySupplementaryItem {
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
