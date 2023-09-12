import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    func signUp(
        emailAddress: String,
        password: String
    ) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                print("an error occured: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func login(
        emailAddress: String,
        password: String
    ) {
//            Auth.auth().signIn(withEmail: emailAddress, password: password) { (result, error) in
//                if error != nil {
//                    print(error?.localizedDescription ?? "")
//                } else {
//                    print("success")
//                }
//            }
        Auth.auth().signIn(withEmail: emailAddress, password: password) { (authResult, error) in
          if let error = error as? NSError {
              switch error.code {
                  case AuthErrorCode.wrongPassword.rawValue:
                      print("wrong password")
                  case AuthErrorCode.invalidEmail.rawValue:
                      print("invalid email")
                  case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                      print("accountExistsWithDifferentCredential")
            default:
                print("Error: \(error.localizedDescription)")
            }
          } else {
            print("User logged in successfully!")
//            let userInfo = Auth.auth().currentUser
//            let email = userInfo?.email
          }
        }
        }
    
    
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
