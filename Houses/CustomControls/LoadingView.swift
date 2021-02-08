//
//  LoadingView.swift
//  Audi_list
//
//  Created by Kaustubh on 14/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import Foundation
import UIKit

public class LoadingView {

    public static let sharedInstance = LoadingView()
    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()

    private init()
    {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.lightGray
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.8
        indicator.style = .large
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = .black
        
    }

    func showIndicator(){
        DispatchQueue.main.async( execute: {
            UIApplication.shared.windows.last?.addSubview(self.blurImg)
            UIApplication.shared.windows.last?.addSubview(self.indicator)
        })
    }
    func hideIndicator(){

        DispatchQueue.main.async( execute:
            {
                self.blurImg.removeFromSuperview()
                self.indicator.removeFromSuperview()
        })
    }
}
