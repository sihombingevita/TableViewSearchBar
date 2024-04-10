//
//  ViewController.swift
//  TableViewSearchBar
//
//  Created by Evita Sihombing on 09/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["Jakarta", "Surabaya", "Bandung", "Medan", "Semarang", "Palembang", "Makassar", "Denpasar", "Bandar Lampung", "Yogyakarta", "Malang", "Padang", "Tangerang", "Bekasi", "Bogor"]
    
    var searchingNames = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchingNames.count
        } else {
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "cell")
        if searching {
            cell?.textLabel?.text = searchingNames[indexPath.row]
        } else {
            cell?.textLabel?.text = data[indexPath.row]
        }
        
        return cell!
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNames = data.filter({ $0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
    }
}

