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
//MARK: -View and Properties
    
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var map: MKMapView!
    
    
    var presenter : MainViewPresenterProtocol?
    
    let notifacations = NotificationCenter.default
     
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.addGeo(map: map)
        gesterSeting()
    }
//MARK: -Life circle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let coordinatel = CoordinationModel(lat: map.annotations.first?.coordinate.latitude, lon: map.annotations.first?.coordinate.longitude)
        
        let dict = ["model" : coordinatel]
        
        notifacations.post(name: NSNotification.Name("name"), object: self, userInfo: dict)
    }
    
//MARK: -Actian func
    @IBAction func GPSButton(_ sender: UIButton) {
        presenter?.addGeo(map: map)
        goButton.isHidden = false
    }
    
    @IBAction func tap(_ sender: UIButton) {
        let coordinatel = CoordinationModel(lat: map.annotations.first?.coordinate.latitude, lon: map.annotations.first?.coordinate.longitude)
        presenter?.tap(coordinate: coordinatel)
        
       
    }
    
    
    @IBAction func buttonTap(_ sender: Any) {
//Create searhController
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController,animated: true,completion: nil)
    }
    @objc private func get(_ sender: UILongPressGestureRecognizer) {
        let delAnnottion = map.annotations
        map.removeAnnotations(delAnnottion)
        let location = sender.location(in: map)
            let coordinate = map.convert(location, toCoordinateFrom: map)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            map.addAnnotation(annotation)
        goButton.isHidden = false
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
        goButton.isHidden = false
    }
}


