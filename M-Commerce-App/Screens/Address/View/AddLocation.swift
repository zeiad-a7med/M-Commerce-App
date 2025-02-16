//
//  MapComponent.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 15/02/2025.
//
import SwiftUI
import MapKit
struct AddLocation: View {
    @StateObject var addressModel = AddressDummyModel()
    let manager = CLLocationManager()
    @State var showLocationPopup = false
    @State var cameraPostion : MapCameraPosition = .userLocation(fallback: .automatic)
    @State var complitionHandler  : ((AddressDummyModel) -> Void)?
  
    var body: some View {
        
        ZStack{
         
                Map(position: $cameraPostion){
                    
                    
                    }.overlay{
                      
                     
                            if showLocationPopup {
                                LocationPopup().offset(y:-60)
                            }
                        ZStack {
                            MapPin()
                                    .frame(width: 50,height: 50)
                                    .foregroundStyle(ThemeManager.darkPuble)
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width:10,height:10)
                                .offset(y:-10)
                           
                        }
                           
                        
                            
                    }
                    .mapControls{
                        MapCompass()
                        MapUserLocationButton()
                            .tint(ThemeManager.darkPuble)
                           
                    }
                    .safeAreaInset(edge: .bottom) {
                    
                        CustomRoundedButtonView(text: "Enter Complete Address" ) {
                            complitionHandler?(addressModel)
                        }
                 
                    }.onMapCameraChange(frequency: .continuous, {
                      
                        showLocationPopup = false
                    })
                    .onMapCameraChange(frequency: .onEnd) { mapCamerUpdate in
                        showLocationPopup = true
                        addressModel.mapModel?.coordinate = mapCamerUpdate.camera.centerCoordinate
                      
                    }
            
          
                
        }.onAppear(){
       
            manager.requestWhenInUseAuthorization()
         
        }
       
       
    }
 
}

#Preview {
    AddLocation()
}
