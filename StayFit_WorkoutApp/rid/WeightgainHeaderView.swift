//
//  WeightgainHeaderView.swift
//  StayFit_WorkoutApp
//
//  Created by Ridmi Natasha on 2023-05-21.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class WeightgainHeaderView: UIView {
    

    private let weightgainimageview: UIImageView = {
        
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        
        return imgView
        
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(weightgainimageview)
        addGradient()
   
 
        
    }
    public func configure(with model: TitleViewModel){
         guard let url = URL(string: model.posterURL) else { return }
        weightgainimageview.sd_setImage(with: url, completed: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        weightgainimageview.frame = bounds
        
        
    }
    
    
    
}
