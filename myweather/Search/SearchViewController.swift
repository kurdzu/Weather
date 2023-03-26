//
//  SearchViewController.swift
//  myweather
//
//  Created by omari katamadze on 25.02.23.
//

import UIKit

class SearchViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchNavigationBar: UINavigationBar!
    
    //MARK: - vars/lets
    var viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        self.navigationItem.hidesSearchBarWhenScrolling = false

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.tintColor = .white
    }

    func setupTableView(){
      tableView.reloadData()
       tableView.delegate = self
       tableView.dataSource = self
        tableView.register(UINib(nibName: SelfLocationTableViewCell.className, bundle: nil), forCellReuseIdentifier: SelfLocationTableViewCell.className)
        tableView.register(UINib(nibName: SearchTableViewCell.className, bundle: nil), forCellReuseIdentifier: SearchTableViewCell.className)
        
    }
    private func updateUI() {
        view.backgroundColor = .clear
        searchBar.delegate = self
        searchBar.searchTextField.backgroundColor = .clear
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        searchBar.tintColor = .white
  
        view.backgroundColor = .clear
        searchNavigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        searchNavigationBar.topItem?.title = "Location".localize
        searchNavigationBar.tintColor = .white
       
    
        
        setupTableView()
    }

    private func bind() {
        viewModel.reloadTablView = {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
        viewModel.getCity()
    }
    
}

extension SearchViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return viewModel.numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if viewModel.filteredCityIsEmpty() {
            
            guard let locationCell = tableView.dequeueReusableCell(withIdentifier: SelfLocationTableViewCell.className, for: indexPath) as? SelfLocationTableViewCell else { return UITableViewCell() }
          locationCell.configure()
            return locationCell
            
        } else {
            
            guard let searchCell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.className, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
            let cellVieModel = viewModel.getCellViewModel(at: indexPath)
            searchCell.configure(filteredCities: cellVieModel)
            return searchCell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        viewModel.didSelectRow(at: indexPath)
        self.dismiss(animated: true)

    }
}





extension SearchViewController : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
        print(text)
        viewModel.searchCity(text: text)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchCity(text: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchCity(text: searchBar.text!)
       self.searchBar.endEditing(true)
    }
    
    
    
    
}
