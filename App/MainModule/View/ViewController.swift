//
//  ViewController.swift
//  App
//
//  Created by Владимир on 23.03.2022.
//

import UIKit
import MapKit
class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var presenter : MainViewPresenterProtocol?
     
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        presenter?.search(searchRequest: searchBar.text, map: map)
    }
    
    
    @IBAction func buttonTap(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController,animated: true,completion: nil)
        print(map.annotations.first?.coordinate.latitude)
        print(map.annotations.first?.coordinate.longitude)
        
    }
   
}
extension ViewController : MainViewProtocol {
    func success() {
        print("Done")
    }
    func failure(error: Error) {
        print("Error")
    }
}

