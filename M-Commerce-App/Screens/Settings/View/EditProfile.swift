//
//  EditProfile.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct EditProfile: View {
    @State var profilePic : String = "https://static.wikia.nocookie.net/dreamworks/images/3/3e/Tai_Lung_Profile.jpg/revision/latest?cb=20240210212257"
    @Binding var userName : String
    @Binding var email : String
    @Binding var address : String
    @State private var showingAlert : Bool = false
    var body: some View {
        VStack{
            ProfileImage(profilePic: profilePic)
             
            VStack(alignment: .leading){
                Text("User name")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(ThemeManager.darkPuble)
                  
                HStack {
                    Image(systemName:"person.fill").foregroundStyle(ThemeManager.darkPuble)
                    TextField("", text: $userName)
                         .padding()
                    
                } .padding(.leading,20)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke()
                            .foregroundStyle(.quinary)
                    }
                Text("Email")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(ThemeManager.darkPuble)
                HStack {
                    Image(systemName:"envelope.fill").foregroundStyle(ThemeManager.darkPuble)
                    TextField("", text: $email)
                         .padding()
                    
                } .padding(.leading,20)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke()
                            .foregroundStyle(.quinary)
                    }
                Text("Address")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(ThemeManager.darkPuble)
                HStack {
                    Image(systemName:"location.fill").foregroundStyle(ThemeManager.darkPuble)
                    TextField("", text: $address)
                         .padding()
                    
                } .padding(.leading,20)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke()
                            .foregroundStyle(.quinary)
                    }
                Spacer()
             
            }.padding()
            
            CustomRoundedButtonView(text: "Save Changes",width: 80) 
        }  .padding()
    
        
    }
}

#Preview {
    EditProfile(userName: .constant("username"),email: .constant("andrew14emad@gmail.com"),address: .constant("Cairo/Egypt"))
}
