//
//  SeachViewController.swift
//  nexflix clone
//
//  Created by erhan demirci on 21.04.2022.
//

import UIKit

class SeachViewController: UIViewController {
    
    private var titles : [Title] = [Title]()
    
    private let discoverTable: UITableView = {
       let table = UITableView()
        table.register(TileTableViewCell.self, forCellReuseIdentifier: TileTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
    
    private let searchController : UISearchController =
    {
        var controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Which movie you want "
        controller.searchBar.searchBarStyle = .minimal
        return controller
       
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
 
        view.backgroundColor = .systemBackground
        view.addSubview(discoverTable)
        discoverTable.dataSource = self
        discoverTable.delegate = self
        navigationItem.searchController = searchController
        
        fetchDiscover()
        searchController.searchResultsUpdater = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
        
        /*NSLayoutConstraint.activate([upcomingTable.topAnchor.constraint(equalTo: view.topAnchor,constant:50),upcomingTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),upcomingTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),upcomingTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)])*/
       
    }
    private func fetchDiscover() {
        APICaller.shared.getDiscoverMovies(completion: { [weak self] result in
            switch result{
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.discoverTable.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
   ) }
    

   

}
extension SeachViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TileTableViewCell.identifier, for: indexPath) as? TileTableViewCell else {return UITableViewCell()}
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: title.original_name ?? title.original_title ?? "uknkown", posterURL: title.poster_path ?? "urlno"))
                
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
extension SeachViewController:UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let query = searchBar.text,
        !query.trimmingCharacters(in: .whitespaces).isEmpty,
        let resultsController = searchController.searchResultsController as? SearchResultViewController else {
            return
        }
        APICaller.shared.getSearch(with: query) { result in
            switch result {
            case .success(let titles):
                resultsController.titles = titles
                DispatchQueue.main.async {
                    resultsController.searchResultCollectionView.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    
    
}
