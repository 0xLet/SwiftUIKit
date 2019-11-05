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
        
        let frame = CGRect(origin: .zero,
                           size: CGSize(width: 1, height: 1))
        
        UIGraphicsBeginImageContext(frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(frame)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.image = image
    }
    
    public init(_ url: URL) {
        super.init(frame: .zero)
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data,
                error == nil else {
                    print("Image \(#function) Error!")
                    print("Issue loading Image with url: \(url.absoluteString)")
                    print("Error: \(error?.localizedDescription ?? "-1")")
                    if #available(iOS 13.0, *) {
                        self?.update(image: .remove)
                    }
                    return
            }
            guard let image = UIImage(data: data) else {
                print("Image \(#function) Error!")
                print("Issue loading Image with url: \(url.absoluteString)")
                print("Error: Could not create UIImage from data")
                if #available(iOS 13.0, *) {
                    self?.update(image: .remove)
                }
                return
            }
            self?.update(image: image)
        }
        
        task.resume()
    }
    
    public init(_ name: String) {
        super.init(frame: .zero)
        
        guard let image = UIImage(named: name) else {
            print("Image \(#function) Error!")
            print("Issue loading Image with name: \(name)")
            print("Error: Could not locate Image")
            if #available(iOS 13.0, *) {
                update(image: .remove)
            }
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
}
