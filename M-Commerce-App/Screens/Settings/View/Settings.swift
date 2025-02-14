//
//  SwiftUIView.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct Settings: View {
    @State var userName : String = "Andrew14"
    @State var email : String = "andrew14emad@gmail.com"
    @State var currentCurrency : String = "USD"
    @State var address :String = "Cairo/Egypt"
    @State var oldPassword : String  = "2424"
    @State var newPassword : String = " "
    @State var confirmNewPassword : String = " "
    var body: some View {
        
        NavigationStack {
            List{
                Section(header:  Text("General").foregroundStyle(ThemeManager.darkPuble).font(.headline)){
                    NavigationLink {
                        EditProfile(userName: $userName,email: $email,address: $address)
                    } label: {
                        SettingsListRow(imageName: "person",RowName: "Edit Profile")
                    }
                    NavigationLink {
                        ChangePassword(oldPassword: $oldPassword, newPassword: $newPassword, confirmPassword: $confirmNewPassword)
                    } label: {
                        SettingsListRow(imageName: "lock",RowName: "Change Password")
                    }
                    
                }
                Section(header:  Text("Prefrences").foregroundStyle(ThemeManager.darkPuble).font(.headline)){
                    Currency()
                
                    NavigationLink {

                    } label: {
                        SettingsListRow(imageName: "rectangle.portrait.and.arrow.forward",RowName: "Logout", imageColor: .red).foregroundStyle(.red)
                    }
                }
  
            }.listRowSpacing(15)
           
        }
    }
}

#Preview {
    Settings()
}
