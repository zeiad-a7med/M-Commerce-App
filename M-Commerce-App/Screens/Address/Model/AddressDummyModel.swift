//
//  AddressDummyModel.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 16/02/2025.
//

import Foundation
import MapKit
class AddressList : ObservableObject{
    @Published var listOfAddress : [AddressDummyModel]?
    init(){
        setListWithDummyData()
    }
    func setListWithDummyData(){
        listOfAddress = []
        let temp1 = AddressDummyModel(Area: "DownTown", Street: "Champlion", building: "5", apartementNumber: 10 ,mapModel: MapModel(coordinate: CLLocationCoordinate2D(latitude: 14, longitude: 14)))
        let temp2 = AddressDummyModel(Area: "Madinet Nasr", Street: "Kolyet el banat", building: "7", apartementNumber: 9, mapModel: MapModel(coordinate: CLLocationCoordinate2D(latitude: 15, longitude: 15)))
        let temp3 = AddressDummyModel(Area: "haday2 el koba", Street: "sodan", building: "2", apartementNumber: 11, mapModel: MapModel(coordinate: CLLocationCoordinate2D(latitude: 16, longitude: 16)))
        listOfAddress?.append(contentsOf: [temp1,temp2,temp3])
    }
}
class AddressDummyModel : ObservableObject{
    
    @Published var Area : String?
    @Published var Street : String?
    @Published var building : String?
    @Published var apartementNumber : Int?
    @Published var mapModel : MapModel?
    init(Area: String? = nil, Street: String? = nil, building: String? = nil, apartementNumber: Int? = nil, mapModel: MapModel? = nil) {
        self.Area = Area
        self.Street = Street
        self.building = building
        self.apartementNumber = apartementNumber
        self.mapModel = mapModel
    }
    

    
}

class MapModel {
    var coordinate : CLLocationCoordinate2D
    var region : MKCoordinateRegion?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    func setCoordinate(latitude: Double, longitude: Double){
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    func setRegion(latitudinalMeter: Double,longitudinalMeter:Double){
       
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: latitudinalMeter, longitudeDelta: longitudinalMeter))
    }
  

    
}
