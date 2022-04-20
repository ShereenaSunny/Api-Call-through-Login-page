import SwiftUI

struct ContentView: View {
  
    @StateObject var viewModel = PersonViewModel()
    @StateObject var check = Validation()

    var body: some View {
        NavigationView {
                VStack {
                    Text("Shaadi")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    EntryField(symbolName: "envelope", placeHolder: "Email Address", prompt: check.emailPrompt, field: $check.email)
                    EntryField(symbolName: "lock", placeHolder: "Password", prompt: check.passwordPrompt, field: $check.password, isSecure: true)
                    

                    NavigationLink(destination: getDisplayPersonView(), isActive: $viewModel.isLoginSuccessful) {
                    
                        Button(
                            ("Login"), action:{ viewModel.fetchPerson(username: check.email, password: check.password)
                            })
                        
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.purple)
                        .cornerRadius(10)
                    }
                    .disabled(!check.isLoginComplete)
                }
            }
            .navigationBarHidden(true)
        }
    
@ViewBuilder func getDisplayPersonView() -> some View {
    if let result = self.viewModel.result {
        DisplayPerson(result: result)
    } else {
        EmptyView()
    }
}
}

struct EntryField: View {
    var symbolName: String
    var placeHolder: String
    var prompt: String
    @Binding var field: String
    var isSecure:Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: symbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                if isSecure {
                    SecureField(placeHolder, text: $field).autocapitalization(.none)
                } else {
                    
                    TextField(placeHolder, text: $field).autocapitalization(.none)
                }
            }
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(10)
            Text(prompt)
            .fixedSize(horizontal: false, vertical: true)
            .font(.caption)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
