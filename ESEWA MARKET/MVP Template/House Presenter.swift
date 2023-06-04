import Foundation

protocol ProHouseView : StatusApi {
    
}

protocol ProHousePresetner {

    
}

class HousePresenter : ProHousePresetner {
    
    weak var view : ProHouseView?
    
    init(view : ProHouseView ) {
        self.view = view
    }
    
}
