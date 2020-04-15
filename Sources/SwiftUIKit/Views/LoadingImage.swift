//
//  LoadingImage.swift
//
//
//  Created by CRi on 11/29/19.
//

import UIKit

@available(iOS 9.0, *)
public class LoadingImage: UIView {
    private var completionHandler: ((UIImage?) -> Void)?
    private var loadingTint: UIColor?
    
    public init(_ url: URL? = nil,
                loadingTint: UIColor? = nil,
                onCompletedLoading: ((UIImage?) -> Void)? = nil) {
        
        super.init(frame: .zero)
        
        self.loadingTint = loadingTint
        completionHandler = onCompletedLoading
        
        embed {
            LoadingView()
                .configure {
                    if let tint = loadingTint {
                        $0.color = tint
                    }
            }
            .start()
        }
        
        guard let url = url else {
            return
        }
        
        load(url: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    public func contentMode(_ mode: UIView.ContentMode) -> Self {
        self.contentMode = mode
        
        return self
    }
    
    @discardableResult
    public func onImageLoaded(_ handler: @escaping (UIImage?) -> Void) -> Self {
        self.completionHandler = handler
        
        return self
    }
    
    @discardableResult
    public func load(url: URL?) -> Self {
        clear().embed {
            LoadingView()
                .configure {
                    if let tint = loadingTint {
                        $0.color = tint
                    }
            }
            .start()
        }
        
        guard let url = url else {
            return self
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data,
                error == nil else {
                    print("Image \(#function) Error!")
                    print("Issue loading Image with url: \(url.absoluteString)")
                    print("Error: \(error?.localizedDescription ?? "-1")")
                    self?.update(color: .red)
                    self?.completionHandler?(nil)
                    return
            }
            guard let image = UIImage(data: data) else {
                print("Image \(#function) Error!")
                print("Issue loading Image with url: \(url.absoluteString)")
                print("Error: Could not create UIImage from data")
                self?.update(color: .red)
                self?.completionHandler?(nil)
                return
            }
            self?.update(image: image)
            self?.completionHandler?(image)
        }
        
        task.resume()
        
        return self
    }
    
    public func update(image: UIImage) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                print("Image \(#function) Error!")
                print("Issue loading Image: \(image)")
                print("Error: Self was nil")
                return
            }
            self.clear()
                .embed {
                    Image(image)
                        .contentMode(self.contentMode)
            }
        }
    }
    
    private func update(color: UIColor) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                print("Image \(#function) Error!")
                print("Issue loading Color: \(color)")
                print("Error: Self was nil")
                return
            }
            self.clear()
                .embed {
                    Image(color)
                        .contentMode(self.contentMode)
            }
        }
    }
}
