//
//  LoginView.swift
//  WeatherShiftUI
//
//  Created by Алексей Логинов on 15.08.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
//MARK: @State
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    
//MARK: Keyboard
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    
//MARK: body
    
    var body: some View {
        
        //MARK: Background
        ZStack {
                imageBackround
            
//MARK: ScrollView
            
            ScrollView(showsIndicators: false) {
                VStack{
                    if shouldShowLogo {
                        Text("Weather")
                            .foregroundColor(Color.yellow)
                            .font(.largeTitle)
                            .padding(.top, 40)
                        
                        VStack{
                            HStack{
                                loginInput
                            }
                            HStack{
                                passwordInput
                            }
                            
                        }.frame(maxWidth: 300)
                            .padding(.top, 50)
                        Spacer()
                        //MARK: Button LogIn
                        
                        Button(action: { print("Hello") }) {
                            Text("Log in")
                                .frame(width: 240, height: 25)
                                .foregroundColor(.black)
                                .background(.yellow)
                                .cornerRadius (25)
                            
                        }
                        .padding(.top, 50)
                        .padding(.bottom, 20)
                        .disabled(login.isEmpty || password.isEmpty)// кнопка не работает, если поля пустые
                    }
                }
                
                .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.default){
                    }
                }
            }
        }
        .accentColor(.red) // цвет начала печати
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

//MARK: ContentView_Previews

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//MARK: UIApplication

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//MARK: backround login view

private extension LoginView {
    var imageBackround: some View  {
        ZStack{
            GeometryReader { geometry in Image("weather")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            }
        }
    }
}

//MARK: Login and Password

private extension LoginView {
    var loginInput: some View {
        HStack{
            Text("Login :")
                .foregroundColor(Color.yellow)
            Spacer()
            TextField("Enter your login", text: $login)
                .frame(width: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(15)
        }
    }
}

private extension LoginView {
    var passwordInput: some View {
        HStack{
            Text("Password :")
                .foregroundColor(Color.yellow)
            Spacer()
            SecureField("Enter passward", text: $password)
                .frame(width: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle().self)
                .cornerRadius(15)
        }
    }
}
