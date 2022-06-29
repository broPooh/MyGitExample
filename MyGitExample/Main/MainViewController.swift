//
//  MainViewController.swift
//  MyGitExample
//
//  Created by bro on 2022/06/28.
//

import UIKit

import Then
import SnapKit

final class MainViewController: BaseViewController {
    
    let mainView = MainView()
    let viewModel = MainViewModel()
    
    var receivedData: Data?
    
    private var requestSearchWorkItem: DispatchWorkItem?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationConfig()
        tableViewConfig()
        searchBarConfig()
        bind()
    }
    
    func navigationConfig() {
        let label = UILabel()
        label.text = "GitHub Stars"
        label.textColor = .label
        label.font = .tabTitle
        //title = "GitHub Stars"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    func tableViewConfig() {
        mainView.searchTableView.delegate = self
        mainView.searchTableView.dataSource = self
    }
    
    func searchBarConfig() {
        mainView.searchBar.delegate = self
    }
    
    private func bind() {
        viewModel.gitHubResponse.bind { response in
            self.mainView.searchTableView.reloadData()
        }
        
        viewModel.isLoading.bind { isLoading in
            isLoading ? self.mainView.showProgress() : self.mainView.dissmissProgress()
        }
    }
    
    private func hideKeyboard() {
        //view.endEditing(true)
        mainView.searchBar.resignFirstResponder()
    }
    
    private func searchUsers(query: String, delayType: SearchDelayType) {
        // 검색어 입력이 들어왔을때 이전 검색이 있으면, 검색 호출을 cancel
        requestSearchWorkItem?.cancel()
        if (checkNetworkValue && !query.isEmpty && viewModel.query != query && !viewModel.isLoading.value) {
            requestSearchWorkItem = DispatchWorkItem { [weak self] in
                self?.hideKeyboard()
                //self?.viewModel.searchUsersDelegate(query: query, delegate: self!, type: .search)
                self?.viewModel.searchUsers(query: query, delegate: self!, type: .search)
            }
                        
            switch delayType {
            case .auto: DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(SearchQuery.queryDelay), execute: requestSearchWorkItem!)
            case .normal: DispatchQueue.main.asyncAfter(deadline: .now(), execute: requestSearchWorkItem!)
            }
        }
    }
    
    private func fetchUsers() {
        if (checkNetworkValue && !viewModel.isLoading.value && viewModel.gitHubResponse.value.totalCount > viewModel.gitHubResponse.value.items.count) {
            viewModel.currentPage += SearchQuery.nextPage
            hideKeyboard()
            viewModel.searchUsersDelegate(query: viewModel.query, delegate: self, type: .fetch)
        }
    }
        
}

// MARK: - TableViewDelegate

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.gitHubResponse.value.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.reuseIdentifier, for: indexPath) as! SearchTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

        
}

// MARK: - SearchBarDelegate

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchUsers(query: searchText, delayType: .auto)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        hideKeyboard()
        searchUsers(query: searchText, delayType: .normal)
    }
    
}


extension MainViewController: URLSessionDataDelegate {

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        if let response = response as? HTTPURLResponse, GitHubStatusCode.ok.rawValue == response.statusCode {
            print("성공")
            return .allow
        } else {
            print("실패")
            return .cancel
        }
    }
    
    //서버에서 데이터를 받을 때마다 반복적으로 호출
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.receivedData?.append(data) //받아오는 데이터를 하나로 합쳐주기
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error, let _ = error as? GitHupAPISearchError {
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            presentAlert(title: "실패", message: "에러가 발생했습니다.", alertActions: okAction)
        } else if let receivedData = self.receivedData {
            print(receivedData)
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let data = try decoder.decode(GitHubResponse.self, from: receivedData)
                viewModel.isLoading.value = false
                viewModel.gitHubResponse.value = data
                print(data)
                //completion(.success(data))
            } catch {
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                presentAlert(title: "실패", message: "파싱 에러가 발생했습니다.", alertActions: okAction)
            }
        }
    }
}
