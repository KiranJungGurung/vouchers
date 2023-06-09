
//  BaseViewController.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 03/06/2023.
//

import UIKit
class BaseViewController <T : UIView > : UIViewController, StatusApi {
    func onError(_ message: String) {
        // show error message

    }

    func onFailure(_ message: String) {
        // show Failure message

    }

    func showLoading() {
        // show loading

    }

    func hideLoading() {
        // hide loading
    }


    override func loadView() {
        let t = T()
        t.backgroundColor = .white
        self.view = t

    }
    var mainView : T {
      if let view = self.view as? T {
        return view
      }else {
        let view = T()
        self.view = view
        return view

      }
    }



}
