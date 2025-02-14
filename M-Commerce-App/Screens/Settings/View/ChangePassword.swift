//
//  ChangePassword.swift
//  M-Commerce-App
//
//  Created by Andrew Emad on 14/02/2025.
//

import SwiftUI

struct ChangePassword: View {
    @Binding var oldPassword : String
    @Binding var newPassword : String
    @Binding var confirmPassword : String
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Old Password")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(ThemeManager.darkPuble)
                
                HStack {
                    Image(systemName:"lock.fill").foregroundStyle(ThemeManager.darkPuble)
                    TextField("", text: $oldPassword)
                        .padding()
                    
                } .padding(.leading,20)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke()
                            .foregroundStyle(.quinary)
                    }
                Text("New Password")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(ThemeManager.darkPuble)
                
                HStack {
                    Image(systemName:"lock.fill").foregroundStyle(ThemeManager.darkPuble)
                    TextField("", text: $oldPassword)
                        .padding()
                    
                } .padding(.leading,20)
                    .overlay{
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke()
                            .foregroundStyle(.quinary)
                    }
                Text("Confirm new Password")
                    .font(.headline)
                    .padding()
                    .foregroundStyle(ThemeManager.darkPuble)
                
                HStack {
                    Image(systemName:"lock.fill").foregroundStyle(ThemeManager.darkPuble)
                    TextField("", text: $oldPassword)
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
        }
    }
}

#Preview {
    ChangePassword(oldPassword: .constant("1414"),newPassword: .constant(""),confirmPassword: .constant(""))
}
