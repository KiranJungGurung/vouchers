import Foundation

protocol ProDashboardPresetner {

}

class DashboardPresenter : ProDashboardPresetner {
    
    weak var view : DashboardView?
   
    
    init(view : DashboardView ) {
        self.view = view
    }
    
}


// view two protocols
// presenter
//
//deadline voli beluka before 5pm


/*
 voli ko project
 esewa ko bus ticket ma gayera
 -> seat legend banaune UI +  functionality
 
 -> select one seat, multiple seat
 -> deselect seat
 -> print in console seat number
 
 selection
 multiple select
 select lai unselect
 print select/unselect
 
 */
