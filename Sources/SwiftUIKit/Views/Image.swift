//
//  Image.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public class Image: UIImageView {
    public init(_ image: UIImage) {
        super.init(image: image)
    }
    
    public init(_ color: UIColor) {
        super.init(frame: .zero)
        
        self.image = Image.image(fromColor: color)
    }
    
    public init(_ name: String) {
        super.init(frame: .zero)
        
        guard let image = UIImage(named: name) else {
            print("Image \(#function) Error!")
            print("Issue loading Image with name: \(name)")
            print("Error: Could not locate Image")
            update(color: .red)
            return
        }
        
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    public func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        
        return self
    }
    
    private func update(image: UIImage) {
        DispatchQueue.main.async { [weak self] in
            self?.image = image
        }
    }
    
    private func update(color: UIColor) {
        DispatchQueue.main.async { [weak self] in
            self?.image = Image.image(fromColor: color)
        }
    }
    
    private static func image(fromColor color: UIColor) -> UIImage? {
        let frame = CGRect(origin: .zero,
                           size: CGSize(width: 1, height: 1))
        
        UIGraphicsBeginImageContext(frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(frame)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
}

