//
//  PogressScreenVC.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi on 2023-05-20.
//

//import UIKit
//
//class PogressScreenVC: UIViewController {
//
//    private var progressRingView: ProgressRingView!
//
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Your Progress"
//        label.textAlignment = .center
//        label.textColor = .white
//        label.font = UIFont.boldSystemFont(ofSize: 34)
//        return label
//
//    }()
//
//       override func viewDidLoad() {
//           super.viewDidLoad()
//           view.backgroundColor = .white
//           view.addSubview(titleLabel)
//           setLabel()
//
//           let frame = CGRect(x: 50, y: 200, width: 150, height: 150)
//           progressRingView = ProgressRingView(frame: frame)
//           view.addSubview(progressRingView)
////
//////           let frame = CGRect(x: 50, y: 200, width: 150, height: 150)
////           progressRingView = ProgressRingView(frame: frame)
////           view.addSubview(progressRingView)
////
////           let frame2 = CGRect(x: 50, y: 300, width: 150, height: 150)
////           progressRingView = ProgressRingView(frame: frame2)
////           view.addSubview(progressRingView)
//
//           let button = UIButton(type: .system)
//           button.setTitle("Start Activity", for: .normal)
//           button.frame = CGRect(x: 100, y: 350, width: 120, height: 40)
//           button.addTarget(self, action: #selector(startActivity), for: .touchUpInside)
//           view.addSubview(button)
//       }
//
//    @objc private func startActivity(){
//        progressRingView.progressRings = [
//            ProgressRing(color: .blue,  progress: 0.8),
//            ProgressRing(color: .red,   progress: 0.6),
//            ProgressRing(color: .green, progress: 0.4)
//        ]
//    }
//
//    func setLabel(){
//        self.view.addSubview(titleLabel)
//        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//        ])
//    }
//
//   }
//
