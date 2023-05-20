//
//  WeightLossScreen.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi on 2023-05-19.
//

import UIKit

class HomepageWLVC: UIViewController {
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
        view.backgroundColor = .white
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

}
