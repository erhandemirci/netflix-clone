//
//  UpComingViewController.swift
//  nexflix clone
//
//  Created by erhan demirci on 21.04.2022.
//

import UIKit

class UpComingViewController: UIViewController {
    
    private var titles : [Title] = [Title]()

    private let upcomingTable: UITableView = {
       let table = UITableView()
        table.register(TileTableViewCell.self, forCellReuseIdentifier: TileTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UpComing"
        navigationController?.navigationBar.prefersLargeTitles = true
 
        view.backgroundColor = .systemBackground
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
       
        
        fetchUpcoming()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //upcomingTable.frame = view.bounds
        
        NSLayoutConstraint.activate([upcomingTable.topAnchor.constraint(equalTo: view.topAnchor,constant:50),upcomingTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),upcomingTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),upcomingTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
       
    }
    private func fetchUpcoming() {
        APICaller.shared.getUpcomingMovies {[weak self] result in
            switch result{
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
    



}
extension UpComingViewController: UITableViewDelegate,UITableViewDataSource{
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
