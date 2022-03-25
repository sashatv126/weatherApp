//
//  Presenter.swift
//  App
//
//  Created by Владимир on 23.03.2022.
//

import Foundation
import MapKit
protocol MainViewProtocol : class {
    func success()
    func failure(error : Error)
}
protocol MainViewPresenterProtocol : class {
    init(view : MainViewProtocol, router : RouterProtocol )
    func search(searchRequest : String?, map : MKMapView )
    func tap(coordinate : CoordinationModel?)
}
class MainPresenter : MainViewPresenterProtocol {
    weak var view : MainViewProtocol?
    var router : RouterProtocol?
    
    
    required init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    func search(searchRequest: String?, map : MKMapView) {
        let search = MKLocalSearch.Request()
        search.naturalLanguageQuery = searchRequest
        let activeSearch = MKLocalSearch(request: search)
        activeSearch.start(completionHandler: { response, error in
            if let error = error  {
                print(error.localizedDescription)
            }
            else {
                let delAnnottion = map.annotations
                map.removeAnnotations(delAnnottion)
                let latitiude = response?.boundingRegion.center.latitude
                let longutude = response?.boundingRegion.center.longitude
                let annotation = MKPointAnnotation()
                annotation.title = searchRequest
                annotation.coordinate = CLLocationCoordinate2DMake(latitiude!, longutude!)
                map.addAnnotation(annotation)
                let coordinate = CLLocationCoordinate2DMake(latitiude!, longutude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate,span: span)
                map.setRegion(region, animated: true)
                print("Done")
            }
        })
       
        
    }
    func tap(coordinate: CoordinationModel?) {
        router?.showSecondVC(coordination: coordinate)
    }
    
    
}