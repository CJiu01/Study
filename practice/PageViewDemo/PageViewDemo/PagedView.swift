//
//  PagedView.swift
//  PageViewDemo
//
//  Created by 최지우 on 2023/02/27.
//

import UIKit
import SnapKit

protocol PagedViewDelegate: AnyObject {
    func didMoveToPage(index: Int)
}

class PagedView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: - Initialization
    init(pages: [UIView] = []) {
        
        self.pages = pages
        super.init(frame: .zero)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    public weak var delegate: PagedViewDelegate?
    
    public var pages: [UIView] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    
    private lazy var collectionView : UICollectionView = {
        
        // 1. 스크롤 가로 방향으로 초기화
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // 2. 컬렉션 보기의 가로 스크롤 표시기를 숨기고 페이징을 활성화
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        // 3. delegate, data source 연결
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        
        collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "PageCollectionViewCell")
        
        return collectionView
    }()
    
    // MARK: - UI Setup
    func setupUI() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView)
        collectionView.backgroundColor = .white
        NSLayoutConstraint.activate([
                     collectionView.widthAnchor
                         .constraint(equalTo: self.widthAnchor),
                     collectionView.heightAnchor
                         .constraint(equalTo: self.heightAnchor),
                     collectionView.centerXAnchor
                         .constraint(equalTo: self.centerXAnchor),
                     collectionView.centerYAnchor
                         .constraint(equalTo: self.centerYAnchor)
                 ])
    }
    
    // MARK: - Data Source
    
    // 총 페이지 수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    // 특정 페이지를 나타내는 UICollectionViewCell 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", for: indexPath) as! PageCollectionViewCell
        
        let page = self.pages[indexPath.item]
        cell.view = page
        return cell
    }
    
    // MARK: - Actions
    
    public func moveToPage(at index: Int) {
        self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - Delegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(self.collectionView.contentOffset.x / self.collectionView.frame.size.width)
        
        self.delegate?.didMoveToPage(index: page)
    }
    
    // MARK: - Layout Delegate
    
    // size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    // page 사이 공간 0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
