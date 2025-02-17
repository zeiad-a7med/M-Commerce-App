//
//  EditProfile.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct EditProfile: View {
    @State var profilePic : String = "https://static.wikia.nocookie.net/dreamworks/images/3/3e/Tai_Lung_Profile.jpg/revision/latest?cb=20240210212257"
    @State var user : ApplicationUser?
    @State private var selectedCountry: Country = Constants.countries.first!
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State private var showingAlert : Bool = false
    var body: some View {
        VStack{
            ProfileImage(profilePic: profilePic)
             
            VStack(alignment: .leading){
                Text("First name")
                    .font(.title2)                
                CustomTextField(
                    placeholder: "First name",
                    onChange: { val in
                        
                    },
                
                    prefix: {
                        Image(systemName:"person.fill")
                    },
                    initialText: $firstName
                    
                )
                
                Text("Last name")
                    .font(.title2)
                    
                CustomTextField(
                    placeholder: "Last name",
                    onChange: { val in
                        
                    },
                    prefix: {
                        Image(systemName:"person.fill")
                    },
                    initialText: $lastName
                    
                )
                
                Text("Email")
                    .font(.title2)
                    
                CustomTextField(
                    placeholder: "Email",
                    onChange: { val in
                        
                    },
                    prefix: {
                        Image(systemName:"envelope.fill")
                    },
                    initialText: $email
                    
                )
                
                Text("phone")
                    .font(.title2)
                CustomTextField(
                    placeholder: "Enter your phone number",
                    onChange: { val in
                        phone = val
                    },
                    prefix: {
                        Picker(
                            "Select Country",
                            selection: $selectedCountry
                        ) {
                            ForEach(Constants.countries, id: \.self) {
                                country in
                                Text(
                                    "\(country.flag) \(country.name) (\(country.code))"
                                )
                                .tag(country)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                    },
                    validationType: .phoneNumber,
                    characterLimit: 10,
                    isValid: { valid in
//                        phoneValid = valid
                    },
                    initialText: $phone
                )
                
                Spacer()
             
            }.padding()
            
            CustomRoundedButtonView(text: "Save Changes",width: 80,isButtonEnabled: .constant(true)) 
        }  .padding()
            .onAppear{
                user = AuthManager.shared.applicationUser!
                email = user?.email ?? ""
                firstName = user?.firstName ?? ""
                lastName = user?.lastName ?? ""
                phone = String(user?.phone?.suffix(10) ?? "")
            }
    
        
    }
}

#Preview {
    EditProfile()
}
