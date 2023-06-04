import Foundation

import UIKit

class HouseVC : BaseViewController< HouseView > {
    
    private var presenter : ProHousePresetner?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        presenter = HousePresenter(view : self )
 
    }
    
}

extension HouseVC : ProHouseView {
  
    
    
}
