//
//  LoadingImage.swift
//  
//
//  Created by CRi on 11/29/19.
//

import UIKit

@available(iOS 9.0, *)
public class LoadingImage: UIView {
    public init(_ url: URL, loadingTint: UIColor? = nil) {
        super.init(frame: .zero)
        embed {
            LoadingView()
                .configure {
                    if let tint = loadingTint {
                        $0.color = tint
                    }
            }
            .start()
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data,
                error == nil else {
                    print("Image \(#function) Error!")
                    print("Issue loading Image with url: \(url.absoluteString)")
                    print("Error: \(error?.localizedDescription ?? "-1")")
                    self?.update(color: .red)
                    return
            }
            guard let image = UIImage(data: data) else {
                print("Image \(#function) Error!")
                print("Issue loading Image with url: \(url.absoluteString)")
                print("Error: Could not create UIImage from data")
                self?.update(color: .red)
                return
            }
            self?.update(image: image)
        }
        
        task.resume()
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
            self?
                .clear()
                .embed { Image(image) }
        }
    }
    
    private func update(color: UIColor) {
        DispatchQueue.main.async { [weak self] in
            self?
                .clear()
                .embed { Image(color) }
        }
    }
}

