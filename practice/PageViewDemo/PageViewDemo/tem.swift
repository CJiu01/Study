//
//  tem.swift
//  PageViewDemo
//
//  Created by 최지우 on 2023/02/27.
//

import UIKit

// 1
protocol TabbedViewDelegate: AnyObject {
    func didMoveToTab(at index: Int)
}

class TabbedView: UIView {
    
    // 2
    enum SizeConfiguration {
        case fillEqually(height: CGFloat, spacing: CGFloat = 0)
        case fixed(width: CGFloat, height: CGFloat, spacing: CGFloat = 0)
        
        var height: CGFloat {
            switch self {
            case let .fillEqually(height, _):
                return height
            case let .fixed(_, height, _):
                return height
            }
        }
    }
    
    // MARK: - Lifecycle
  
    // 3
    init(sizeConfiguration: SizeConfiguration) {
        
        self.sizeConfiguration = sizeConfiguration
        super.init(frame: .zero)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    weak var delegate: TabbedViewDelegate?
    
    public let sizeConfiguration: SizeConfiguration
  
    // 4
    private var currentlySelectedIndex: Int = 0
    
    // 5
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        return collectionView
    }()
    
    // MARK: UI Setup
  
    // 6
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor
                .constraint(equalTo: self.leftAnchor),
            collectionView.topAnchor
                .constraint(equalTo: self.topAnchor),
            collectionView.rightAnchor
                .constraint(equalTo: self.rightAnchor),
            collectionView.bottomAnchor
                .constraint(equalTo: self.bottomAnchor)
        ])
    }
}
