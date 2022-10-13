//
//  ViewController.swift
//  LetChat
//
//  Created by manukant tyagi on 26/09/22.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController {
    
    //MARK: - Vars
    var isLogin = true

    //MARK: - IBOutlets
    
    //Labels
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var signupLabel: UILabel!
    
    //textFields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!
    
    // Buttons
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var resendPasswordButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    //Views
    @IBOutlet weak var repeatPasswordLineView: UIView!
    
    
    //MARK: - ViewLife Cycle
    
    //View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfieldDelegates()
        updateUIFor(login: true)
        setupBackgroundTap()
    }

    
    //MARK: - IB Actions
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: "forgot password"){
            
        }else{
            ProgressHUD.showFailed("Email is required.")
        }
    }
    
    @IBAction func resendEmailButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: "forgot password"){
            
        }else{
            ProgressHUD.showFailed("Email is required.")
        }

    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: isLogin ? "login" : "register"){
            
        }else{
            ProgressHUD.showFailed("All fields are required.")
        }
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        updateUIFor(login: sender.titleLabel?.text == "Login")
        isLogin.toggle()
        
    }
    
    //MARK: - Setup
    private func setupTextfieldDelegates(){
        emailTextField.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        passwordTextfield.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
        repeatPasswordTextfield.addTarget(self, action: #selector(textfieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textfieldDidChange(_ textfield: UITextField){
        updatePlaceHolderLabels(textfield: textfield)
    }
    
    private func setupBackgroundTap(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func backgroundTap(){
        view.endEditing(true)
    }
    
    //MARK: - Animations
    private func updateUIFor(login: Bool){
        loginButton.setImage(UIImage(named:  login ? "loginBtn" : "registerBtn"), for: .normal)
        signupButton.setTitle(login ? "Sign up" : "Login", for: .normal)
        signupLabel.text = login ? "Don't have an account" : "Have an account?"
        UIView.animate(withDuration: 0.5) {
            self.repeatPasswordTextfield.isHidden = login
            self.repeatPasswordLineView.isHidden = login
            self.repeatPasswordLabel.isHidden = login
        }
        
    }
    
    private func updatePlaceHolderLabels(textfield: UITextField){
        switch textfield{
        case emailTextField:
            emailLabel.text = textfield.hasText ? "Email" : ""
        case passwordTextfield:
            passwordLabel.text = textfield.hasText ? "Password" : ""
        default:
            repeatPasswordLabel.text = textfield.hasText ? "repeat Password" : ""
            
        }
    }
    
    //MARK: - Helpers
    private func isDataInputedFor(type: String) -> Bool{
        switch type{
        case "login":
            return emailTextField.text != "" && passwordTextfield.text != ""
        case "register":
            return emailTextField.text != "" && passwordTextfield.text != "" && repeatPasswordTextfield.text != ""
        default:
            return emailTextField.text != ""
        }
    }
    
}

