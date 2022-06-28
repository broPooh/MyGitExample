//
//  CustomTabBar.swift
//  MyGitExample
//
//  Created by bro on 2022/06/28.
//

import UIKit

import Then
import SnapKit

protocol CustomTabBarDelegate {
    func scrollToIndex(scrollTo index: Int)
}

final class CustomTabBar: BaseUIView, Reusable {
    static var reuseIdentifier: String {
         return String(describing: self)
     }
    
    var delegate: CustomTabBarDelegate?
    let titles = ["API", "Local"]
    
    let customTabBarCollectionView = UICollectionView().then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.frame = .zero
        $0.collectionViewLayout = layout
        $0.backgroundColor = .white
        
        $0.showsHorizontalScrollIndicator = false
        $0.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: TabCollectionViewCell.reuseIdentifier)
        $0.isScrollEnabled = false
        $0.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
    }
    
    let indicatorView =  UIView().then {
        $0.backgroundColor = .toolbarActiveColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionViewConfig()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupView() {
        addSubview(customTabBarCollectionView)
        addSubview(indicatorView)
    }

    override func setupConstraints() {
        customTabBarCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(TabBarSize.tabBarHeight)
        }
        
        indicatorView.snp.makeConstraints {
            $0.width.equalTo(Int(TabBarSize.deviceWidth) / Int(TabBarSize.tabSize))
            $0.height.equalTo(TabBarSize.indicatorHeight)
            $0.leading.equalTo(customTabBarCollectionView.snp.leading)
            $0.bottom.equalToSuperview()
        }
    }
    
    func collectionViewConfig() {
        customTabBarCollectionView.delegate = self
        customTabBarCollectionView.dataSource = self
    }
    
    func updateIndicatorView(scrollView: UIScrollView) {
        indicatorView.snp.updateConstraints {
            $0.leading.equalTo(Int(scrollView.contentOffset.x) / TabBarSize.tabSize)
        }
    }
    
}

//MARK: - UICollectionViewDelegate, DataSource

extension CustomTabBar: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.reuseIdentifier, for: indexPath) as! TabCollectionViewCell
        let data = titles[indexPath.row]
        cell.configure(title: data)
        return cell
    }
        
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(TabBarSize.deviceWidth) / TabBarSize.tabSize , height: TabBarSize.tabBarHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollToIndex(scrollTo: indexPath.row)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TabCollectionViewCell else { return }
        //cell.titleLabel.textColor = isSelected ? .toolbarActiveColor : .toolbarinActiveColor
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateIndicatorView(scrollView: scrollView)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension CustomTabBar: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
