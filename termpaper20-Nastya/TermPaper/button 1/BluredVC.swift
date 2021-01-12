//
//  BluredVC.swift
//  TermPaper
//
//  Created by Anasva on 27.04.2020.
//  Copyright © 2020 Anasva. All rights reserved.
//

import UIKit

class BluredVC: UIViewController {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "UTAM4409")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let blureVEV: UIVisualEffectView = {
       let blureVOV = UIVisualEffectView()
        blureVOV.layer.cornerRadius = 20
        blureVOV.clipsToBounds = true
        blureVOV.translatesAutoresizingMaskIntoConstraints = false
        return blureVOV
    }()
    
    let labelForBlureVEV: UILabel = {
        let labelForBlureVOV = UILabel()
        labelForBlureVOV.text = "get up"
        labelForBlureVOV.textColor = #colorLiteral(red: 0.2615792751, green: 0.2857673466, blue: 0.6650569439, alpha: 1)
        labelForBlureVOV.textAlignment = .center
        labelForBlureVOV.translatesAutoresizingMaskIntoConstraints = false
        return labelForBlureVOV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        

        imageView.addSubview(blureVEV)
        blureVEV.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        blureVEV.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        blureVEV.heightAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        blureVEV.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true

        let blurEffect = UIBlurEffect(style: .light)
        blureVEV.effect = blurEffect

        blureVEV.contentView.addSubview(labelForBlureVEV)
        labelForBlureVEV.centerXAnchor.constraint(equalTo: blureVEV.centerXAnchor).isActive = true
        labelForBlureVEV.centerYAnchor.constraint(equalTo: blureVEV.centerYAnchor).isActive = true
        labelForBlureVEV.heightAnchor.constraint(equalToConstant: 200).isActive = true
        labelForBlureVEV.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        blureVEV.isHidden = true
    }
    

}
