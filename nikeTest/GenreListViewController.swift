//
//  GenreListViewController.swift
//  nikeTest
//
//  Created by karthik yalamanchili on 5/4/20.
//  Copyright © 2020 karthik yalamanchili. All rights reserved.
//

import UIKit

struct Cells {
    static let GenreCell = "GenreListTableCell"
}


class GenreListViewController: UIViewController {
    
    var genreTableView = UITableView ()
    var responseData = [AlbumInfo] (){
        didSet {
            DispatchQueue.main.async {
                self.genreTableView.reloadData()
                self.navigationItem.title  = "Top \(self.responseData.count) Albums "
                self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemPink]
                self.navigationController?.navigationBar.tintColor = UIColor.systemPink
                self.navigationController?.navigationBar.barTintColor = UIColor(red: 31/255, green: 31/255, blue:34/255, alpha: 1.0)
                
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        let responseData = appleRequest ()
        responseData.fetchData {[weak self] result in
            switch result {
            case.failure(let error):
                print(error)
                
            case .success(let gathertedData): self?.responseData = gathertedData
            }
        }
        
        ConfigureTableForGenreList()
        
    }
    
// MARK: - setUpTable

    func ConfigureTableForGenreList() {
        
        SetDelgatesForTable()
        view.addSubview(genreTableView)
        genreTableView.register(GenreListTableCell.self, forCellReuseIdentifier: Cells.GenreCell)
        genreTableView.rowHeight = 100
        genreTableView.frame = self.view.frame
        genreTableView.pin(to: view)
        genreTableView.backgroundColor = UIColor(red: 31/255, green: 31/255, blue:34/255, alpha: 1.0)

    }
    
    
    func SetDelgatesForTable() {
        genreTableView.delegate = self
        genreTableView.dataSource = self
    }
    
    
}

// MARK: - tableDelegateFunctions

extension GenreListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: Cells.GenreCell) as! GenreListTableCell
        let  cellData = responseData[indexPath.row]
        cell.SetupCell(Genre: cellData)
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transmitVC = DetailsViewController ()
        
        let  vcData = responseData[indexPath.row]
        transmitVC.SetupDetails(DetailData: vcData)
        self.navigationController?.pushViewController(transmitVC, animated: true)
    }
    
    
    
}
