//
//  ImagePlaceholderTextField.swift
//  ImagePlaceholderTextField
//
//  Created by Brent Michalski on 1/24/19.
//  Copyright © 2019 Perlguy, Inc. All rights reserved.
//

import UIKit
import FontAwesome_swift

@IBDesignable
class ImagePlaceholderTextField: UIView {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBInspectable
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint! {
        didSet {
            imageView.size = CGSize(width: imageViewHeightConstraint.constant, height: imageViewHeightConstraint.constant)
        }
    }
    
    @IBInspectable
    public var image: UIImage? = nil {
        didSet {
            imageView.image = image
        }
    }
    
    
    @IBInspectable
    public var imageHeight: CGFloat = 40 {
        didSet {
            imageView.size = CGSize(width: imageHeight, height: imageHeight)
            imageViewHeightConstraint.constant = imageHeight
        }
    }
    
    
    @IBInspectable public var FA_imageName: String? {
        didSet {
            guard let FA_imageName = FA_imageName else { return }
            if let faImage = FontAwesome(rawValue: FA_imageName) {
                imageView.image = UIImage.fontAwesomeIcon(name: faImage, style: FontAwesomeStyle.regular, textColor: UIColor.black, size: CGSize(width: 30, height: 30))
            }
        }
    }
    
    @IBInspectable
    public var bgColor: UIColor? = nil {
        didSet {
            containerView.backgroundColor = bgColor
        }
    }
    
    @IBInspectable
    public var placeholderText: String? = nil {
        didSet {
            textField.placeholder = placeholderText
        }
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        updateDefaultsForInterfaceBuilder()
    }
    
    
    func updateDefaultsForInterfaceBuilder() {
        if image == nil {
            image = UIImage.fontAwesomeIcon(name: .user, style: .regular, textColor: .black, size: CGSize(width: 30, height: 30))
        }
        
        if bgColor == nil {
            bgColor = .orange
        }
        
        if placeholderText == nil {
            placeholderText = "Default Placeholder Text"
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }
    
    
    private func initNib() {
        if !self.subviews.isEmpty { return }
        
        let bundle = Bundle(for: ImagePlaceholderTextField.self)
        bundle.loadNibNamed(String(describing: ImagePlaceholderTextField.self), owner: self, options: nil)
        
        self.addSubview(self.containerView)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
        
        clipsToBounds      = true
    }
    
    
    
}

