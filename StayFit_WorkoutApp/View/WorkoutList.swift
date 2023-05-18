//
//  WorkoutList.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi on 2023-05-17.
//

import UIKit

class WorkoutList: UIViewController {
    let  ScheduleButton = UIButton ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ScheduleButton)
        setScheduleButton()


    }
    func setScheduleButton(){
        
        ScheduleButton.configuration = .filled()
        self.ScheduleButton.configuration?.baseBackgroundColor = UIColor.AppColor
      
        ScheduleButton.setAttributedTitle(customButton, for: .normal)
        ScheduleButton.addTarget(self, action:#selector(gotoScheduleScreen), for: .touchUpInside)
    
        ScheduleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ScheduleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 120),
            ScheduleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ScheduleButton.widthAnchor.constraint(equalToConstant: 250),
            ScheduleButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        
    }

    
    
    let customButton = NSMutableAttributedString(string: "Get Started", attributes: [
        NSAttributedString.Key.foregroundColor : UIColor.black,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)
        
    ])
    
    
   @objc func gotoScheduleScreen (){
    let schedueScreen = IndiviuallWorkout()
       navigationController?.pushViewController(schedueScreen, animated:true)
    }
    
    

}
