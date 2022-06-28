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
    let searchTableView = UITableView()
    
    let hud = JGProgressHUD()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
            $0.top.equalToSuperview()
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
            $0.bottom.equalToSuperview()
        }
    }
    
    func showProgress() {
        hud.show(in: self)
    }
    
    func dissmissProgress() {
        hud.dismiss()
    }
}
