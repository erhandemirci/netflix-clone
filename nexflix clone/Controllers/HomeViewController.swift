//
//  HomeViewController.swift
//  nexflix clone
//
//  Created by erhan demirci on 21.04.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        configureNavBar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        
        homeFeedTable.tableHeaderView = headerView
    }
    private func configureNavBar()
    {
        // fırat
        let containerView = UIControl(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
            containerView.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
            let imageSearch = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
            imageSearch.image = UIImage(named: "netflixLogo")
            containerView.addSubview(imageSearch)
            let searchBarButtonItem = UIBarButtonItem(customView: containerView)
            searchBarButtonItem.width = 20
            navigationItem.rightBarButtonItem = searchBarButtonItem
        
        /*var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        */
        
    }
    @objc func handleSearch()
    {
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
       print("viewDidLayoutSubviews")

    }
    

   

}
extension HomeViewController: UITableViewDataSource , UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else
        {
            return UITableViewCell()
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    
}
