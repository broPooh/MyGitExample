//
//  MainView.swift
//  MyGitExample
//
//  Created by bro on 2022/06/28.
//

import UIKit

import Then
import SnapKit
import JGProgressHUD

final class MainView: BaseUIView {
    
    let customTabBar = CustomTabBar()
    let searchBar = UISearchBar().then {
        $0.setImage(UIImage(named: SystemImage.icSearchNonW.rawValue), for: UISearchBar.Icon.search, state: .normal)
        $0.setImage(UIImage(named: SystemImage.icCancel.rawValue), for: .clear, state: .normal)

        //ios 12대응
        $0.textField?.textColor = .lableColor
        $0.textField?.backgroundColor = .searchBarBackground
        $0.textField?.leftView?.tintColor = .searchIconColor
        $0.textField?.rightView?.tintColor = .searchIconColor
    }
    let searchTableView = UITableView().then {
        
        $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.reuseIdentifier)
        $0.separatorStyle = .none
    }
    
    let hud = JGProgressHUD()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customTabConfig()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupView() {
        addSubview(customTabBar)
        addSubview(searchBar)
        addSubview(searchTableView)
    }
    
    override func setupConstraints() {
        
        customTabBar.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(TabBarSize.tabBarHeight)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(customTabBar.snp.bottom).offset(SearchBarSize.topOffset)
            $0.leading.equalToSuperview().offset(SearchBarSize.leadingOffset)
            $0.trailing.equalToSuperview().offset(SearchBarSize.traillingOffset)
            $0.height.equalTo(SearchBarSize.height)
        }
        
        searchTableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(SearchBarSize.topOffset)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    func showProgress() {
        hud.show(in: self)
    }
    
    func dissmissProgress() {
        hud.dismiss()
    }
    
    func customTabConfig() {
        customTabBar.customTabBarCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
    }
}
