//
//  RegisterView.swift
//  M-Commerce-App
//
//  Created by Zeiad on 15/02/2025.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var email: String = ""
    @State private var emailValid: Bool = false

    @State private var password: String = ""
    @State private var passwordValid: Bool = false

    @State private var isFormValid = false

    var body: some View {

        ScrollView{
            VStack {
                //Email
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.title2)
                    CustomTextField(
                        placeholder: "Enter your email",
                        onChange: { val in
                            email = val
                        },
                        prefix: { Image(systemName: "envelope") },
                        validationType: .email,
                        isValid: { valid in
                            emailValid = valid
                        },
                        initialText: .constant("")
                    )
                }.padding(.bottom, 10)

                //Password
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.title2)
                    CustomSecureField(
                        placeholder: "Enter your password",
                        onChange: { val in
                            password = val
                        },
                        prefix: { Image(systemName: "lock") },
                        validationType: .password,
                        isValid: { valid in
                            passwordValid = valid
                        }
                    )
                }.padding(.bottom, 30)

                CustomRoundedButtonView(
                    text: "Sign In", width: 50,
                    onTap: {
                        viewModel.login(email: email, password: password)
                    },
                    isButtonEnabled: $isFormValid
                )
                .onChange(
                    of: emailValid,
                    { oldValue, newValue in
                        updateFormValidity()
                    }
                )
                .onChange(
                    of: passwordValid,
                    { oldValue, newValue in
                        updateFormValidity()
                    })

                
                    Text("Don't have an account? Create account")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                        .padding(.bottom,10)
                        .onTapGesture {
                            NavigationManager.shared.pushReplacement(.register)
                        }
                if(viewModel.resendVerficationMailVisible && Auth.auth().currentUser != nil){
                    Button(action: {
                        viewModel.resendEmailVerification()
                    },label: {
                        Text("Resend verfication mail")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }).padding(.top, 10)
                }
                

                Spacer()
                
    //            NavigationLink(
    //                destination: ContentView(), isActive: .constant(viewModel.successLogin)
    //            ) {
    //                EmptyView()
    //            }

            }.padding(20)
        }
            .navigationTitle("Sign In")

    }
    func updateFormValidity() {
        isFormValid = [emailValid, passwordValid].allSatisfy { $0 }
    }
}

#Preview {
    LoginView()
}
//lastName: "ahmed"
//            email: "zeiadahmed194@gmail.com"
//            phone: "+201018698825"
//            password: "zeiadahmed194"
//            acceptsMarketing: false
//            firstName: "zeiad"
