//
//  Utility.swift
//  Code
//
//  Created by Yogesh2 Gupta on 13/02/22.
//

import UIKit

class Utility: NSObject {
    static func showAlert(error : LError) {
     let alertController  = UIAlertController.init(title: error.errortitle, message: error.errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        let appDelegate  = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
