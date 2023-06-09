//
//  StatusApi.swift
//  ESEWA MARKET
//
//  Created by Kiran Gurung on 03/06/2023.
//

import Foundation

protocol StatusApi : class {
   func onError(_ message : String )
   func onFailure (_ message : String )
   func showLoading ()
   func hideLoading ()
}
