//
//  ISSignInView.swift
//  Ishop
//
//  Created by Santiago Benítez Arenas on 5/05/24.
//

import SwiftUI

struct ISSignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State var remember: Bool = false
    
    var body: some View {
        VStack{
            //MARK: - Header Sign In
            GeometryReader { proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                AnyView(
                    ZStack {
                        UnevenRoundedRectangle(cornerRadii: .init(
                            bottomLeading: 60,
                            bottomTrailing: 60
                        ))
                        .fill(.black)
                        .offset(y: -height / 2)
                        .frame(height: 350)
                    }
                )
            }
            .frame(maxHeight: getRect().height / 1.5)
            .overlay {
                VStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    Text("Welcome Back!")
                        .foregroundStyle(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding(.bottom, 250)
            }
            
            //MARK: - Sign In Form
            ZStack {
                VStack(spacing: 20) {
                    HStack {
                        Text("Sign In")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    Group {
                        TextField("Username", text: $email)
                        HStack {
                            Group {
                                if !showPassword {
                                    SecureField("Password", text: $password)
                                } else {
                                    TextField("Password", text: $password)
                                }
                            }
                            
                            Button(action: {showPassword.toggle()}, label: {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.black)
                            })
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    
                    
                    HStack {
                        Toggle(isOn: $remember) {
                           Text("Remember me")
                                .font(.footnote)
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                        Spacer()
                        Text("Forgot password")
                            .font(.footnote)
                            .bold()
                            .foregroundStyle(.gray)
                    }
                    
                    //MARK: - Auth Methods
                    Button(action: {}, label: {
                        Text("Log In")
                            .bold()
                    })
                    .frame(width: 350, height: 50)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    LabelledDivider(label: "or")
                    
                    Group {
                        Button(action: {}, label: {
                            Text("Continue with Google")
                        })
                        
                        Button(action: {}, label: {
                            Text("Continue with Apple")
                        })
                        Button(action: {}, label: {
                            Text("Continue with Facebook")
                        })
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                    .frame(width: 350, height: 50)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .stroke(.gray, lineWidth: 1)

                    )
                    
                    
                }
                .frame(width: 350, height: 50)
                .padding(.top, 50)
                .frame(width: getRect().width)
            }
            .frame(maxHeight: .infinity, alignment: .top)
                        
        }
    }
}


extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
        .foregroundColor(.black)
    }
}

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

#Preview {
    ISSignInView()
}
