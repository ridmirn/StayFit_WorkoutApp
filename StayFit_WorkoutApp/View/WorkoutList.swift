//
//  WorkoutList.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi on 2023-05-17.
//

import UIKit

class WorkoutList: UIViewController {
    let  ScheduleButton = UIButton ()
    private let bmiValue: Double
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init (bmiValue: Double){
        self.bmiValue = bmiValue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ScheduleButton)
        view.backgroundColor = .white
        setScheduleButton()
        setupViews()
        setupContraints()
        displayBMIValue()
    }
    private func setupViews(){
        view.addSubview(resultLabel)
    }
    
    private func setupContraints(){
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func displayBMIValue(){
        let formattedBMI = String(format: "%.2f", bmiValue)
        resultLabel.text = "Your BMI is \(formattedBMI)"
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
    let schedueScreen = ScheduleScreen()
       navigationController?.pushViewController(schedueScreen, animated:true)
    }
}
