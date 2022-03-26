//
//  ViewController.swift
//  App
//
//  Created by Владимир on 23.03.2022.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    
    var presenter : MainViewPresenterProtocol?
     
    override func viewDidLoad() {
        super.viewDidLoad()
       
        gesterSeting()
    }
    @IBAction func buttonTap(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController,animated: true,completion: nil)
        print(map.annotations.first?.coordinate.latitude)
        print(map.annotations.first?.coordinate.longitude)
        
    }
    @objc private func get(_ sender: UILongPressGestureRecognizer) {
        let delAnnottion = map.annotations
        map.removeAnnotations(delAnnottion)
    
        let location = sender.location(in: map)
            let coordinate = map.convert(location, toCoordinateFrom: map)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            print(coordinate)
        
            map.addAnnotation(annotation)
    }
    
    private func gesterSeting() {
        let  longPressRecognizer = UILongPressGestureRecognizer(target: self,
                                                                        action: #selector(get))
        longPressRecognizer.minimumPressDuration = 0.5
        longPressRecognizer.delegate = self
        map.addGestureRecognizer(longPressRecognizer)
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
extension ViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        presenter?.search(searchRequest: searchBar.text, map: map)
    }
}


