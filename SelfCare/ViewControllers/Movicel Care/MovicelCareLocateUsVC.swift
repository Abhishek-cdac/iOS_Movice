//
//  MovicelCareLocateUsVC.swift
//  SelfCare
//
//  Created by Sagar Ranshur on 19/05/20.
//  Copyright © 2020 Sagar Ranshur. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MovicelCareLocateUsVC: UIViewController,UISearchBarDelegate,CustomAlertDelegate {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var baseView1: UIView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var baseView2: UIView!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var baseView3: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var storeBaseView: UIView!
    @IBOutlet weak var serviceCenterBaseView: UIView!
    @IBOutlet weak var mobileNoTxt: UILabel!
    @IBOutlet weak var serviceCenterTableView: UITableView!
    
    @IBOutlet weak var mapSearchBar: UISearchBar!

    var searchActive : Bool = false

    let geocoder = CLGeocoder()
    let locationManager = CLLocationManager()
    
    struct Location {
        var latitude : Double = 0.0
        var longitude : Double = 0.0
        var name : String = ""
        
        init(lat: Double,long: Double,name: String) {
            self.latitude = lat
            self.longitude = long
            self.name = name
        }
    }
    
    var nearByPlacesArray = [Location]()
    
    //MARK: - viewDidLoad methods
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpMapView()
    }
    
    func setUpView() {
        label1.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        baseView1.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        label2.textColor = UIColor.gray
        baseView2.backgroundColor = UIColor.clear
        label3.textColor = UIColor.gray
        baseView3.backgroundColor = UIColor.clear
        
        serviceCenterBaseView.isHidden = true
        storeBaseView.isHidden = false
        mobileNoTxt.text = Constants.singleton.contactNo
        
        mapSearchBar.showsCancelButton = false
        mapSearchBar.delegate = self
        
        Utility.customAlertView.delegate = self
    }
    
    func setUpMapView() {
        let location1 = Location.init(lat: -8.8736, long: 13.2548, name: "Kilamba Kiaxi, Angola")
        let location2 = Location.init(lat: -8.8147, long: 13.2302, name: "Luanda, Angola")
        let location3 = Location.init(lat: -6.1410, long: 12.3521, name: "Soyo, Angola")
        let location4 = Location.init(lat: -12.36420, long: 13.5482, name: "Lobito, Angola")

        

        nearByPlacesArray.append(location1)
        nearByPlacesArray.append(location2)
        nearByPlacesArray.append(location3)
        nearByPlacesArray.append(location4)
        let lat  = -8.8147
        let long  = 13.2302
        showCurrentLocationOnMap(sourceLat:lat, sourceLong: long)
    }
    
    func showCurrentLocationOnMap(sourceLat:Double, sourceLong: Double){
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        
        let camera = GMSCameraPosition.camera(withLatitude: sourceLat, longitude: sourceLong, zoom: 12.0)

        mapView.camera = camera
                
        for data in nearByPlacesArray{
            let location = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            let marker = GMSMarker.init(position: location)
//            marker.position = location
            marker.snippet = data.name
            marker.map = mapView
        }
    }
    
    //MARK: - UISearchView Delegate Methods
    //MARK: -
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;

        mapSearchBar.text = nil
        mapSearchBar.resignFirstResponder()
        self.mapSearchBar.showsCancelButton = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != "" {
            getLatLongFromAddress(addressStr: searchBar.text ?? "")
        }
        mapSearchBar.text = nil
        mapSearchBar.resignFirstResponder()
    }
    
    //MARK: - Lat long delegate methods
    //MARK: -
    
    func getLatLongFromAddress(addressStr: String)   {
        
        var coordinates = CLLocationCoordinate2D()
        
        geocoder.geocodeAddressString(addressStr) { (placemarks, error) in
            
            if let placeMarks = placemarks?.first {
                coordinates = placeMarks.location?.coordinate as! CLLocationCoordinate2D
                
                let latStr = "\(coordinates.latitude)"
                let longStr = "\(coordinates.longitude)"

                self.showCurrentLocationOnMap(sourceLat:coordinates.latitude , sourceLong: coordinates.longitude)
            }else {
                Utility.setUpAlert(isSingle: true, isSuccessAlert: false, title: "", message: "Failed to get Lat Long,please try again!", image: "fail")
                Utility.showCustomAlert()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let loc = locations.last
        let lat = loc?.coordinate.latitude ?? 0.0
        let long = loc?.coordinate.longitude ?? 0.0
        
        self.showCurrentLocationOnMap(sourceLat: lat, sourceLong: long)
        self.locationManager.stopUpdatingLocation()
    }
    
    //MARK: - CustomAlertDelegate methods
    //MARK: -
    
    func okButtonClicked() {
        Utility.removeAlert()
    }
    
    func cancelButtonClicked() {
        Utility.removeAlert()
    }
    
    func centeredButtonClicked() {
        Utility.removeAlert()
    }

 
    //MARK: - UITapgesture action methods
    //MARK: -
    @IBAction func storeSegmentClicked(_ sender: UITapGestureRecognizer) {
        label1.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        baseView1.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        label2.textColor = UIColor.gray
        baseView2.backgroundColor = UIColor.clear
        label3.textColor = UIColor.gray
        baseView3.backgroundColor = UIColor.clear
        
        serviceCenterBaseView.isHidden = true
        storeBaseView.isHidden = false
    }
    
    @IBAction func serviceCenterClicked(_ sender: UITapGestureRecognizer) {
        label2.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        baseView2.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        label1.textColor = UIColor.gray
        baseView1.backgroundColor = UIColor.clear
        label3.textColor = UIColor.gray
        baseView3.backgroundColor = UIColor.clear
        
        serviceCenterBaseView.isHidden = false
        storeBaseView.isHidden = true
    }
    
    @IBAction func historyClicked(_ sender: UITapGestureRecognizer) {
        label3.textColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        baseView3.backgroundColor = UIColor.init(hexString: Constants.HexColors.activeColor)
        label1.textColor = UIColor.gray
        baseView1.backgroundColor = UIColor.clear
        label2.textColor = UIColor.gray
        baseView2.backgroundColor = UIColor.clear
    }
    
    //MARK: - Button action methods
    //MARK: -
    @IBAction func backButtonClicked(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
}

extension MovicelCareLocateUsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = serviceCenterTableView.dequeueReusableCell(withIdentifier: "cell") as! ServiceCenterTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
