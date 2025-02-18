//
//  TextValidation.swift
//  M-Commerce-App
//
//  Created by Zeiad on 16/02/2025.
//

import Foundation

class TextValidation {

    static func validateText(_ input: String, type: ValidationType) -> String? {
        let validator = TextValidation()
        switch type {
        case .name:
            return validator.validateName(input)
        case .email:
            return validator.validateEmail(input)
        case .password:
            return validator.validatePassword(input)
        case .phoneNumber:
            return validator.validatePhoneNumber(input)
        case .numeric:
            return validator.validateNumeric(input)
        default:
            return validator.validateLength(input)
        }
    }
    
    // Function for minimum length validation
    private func validateLength(_ input: String) -> String? {
        return input.count >= 3 ? nil : "Text must be at least 3 characters long"
    }
    
    
    // Function for name validation (only letters, at least 2 characters)
    private func validateName(_ input: String) -> String? {
        let nameRegex = "^[A-Za-z\\s]{2,}$" // Allows letters and spaces, min length 2
        let isValid = NSPredicate(format: "SELF MATCHES %@", nameRegex).evaluate(with: input)

        return isValid ? nil : "Name must contain only letters and be at least 2 characters long"
    }

    // Function for email validation
    private func validateEmail(_ input: String) -> String? {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let isValid = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: input)
        
        return isValid ? nil : "Invalid email"
    }

    // Function for numeric-only validation
    private func validateNumeric(_ input: String) -> String? {
        let numberRegex = "^[0-9]*$"
        let isValid = NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with: input)
        
        return isValid ? nil : "Only numbers are allowed"
    }

    // Function to check if phone number contains only digits and has correct length
    private func validatePhoneNumber(_ input: String) -> String? {
        let phoneRegex = "^[0-9]{10}$" // Modify length if needed
        let isValid = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: input)

        if input.count != 10 {
            return "Phone number must be 10 digits long"
        } else if !isValid {
            return "Invalid phone number"
        }
        return nil
    }
    
    // Function to validate password strength
    private func validatePassword(_ input: String) -> String? {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        let isValid = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: input)
        return isValid ? nil : "Password must be at least 8 characters long, with one uppercase, one lowercase, one number, and one special character"
    }
}

enum ValidationType {
    case email
    case password
    case phoneNumber
    case text
    case name
    case numeric
}
