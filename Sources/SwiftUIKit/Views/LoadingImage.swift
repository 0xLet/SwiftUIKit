//
//  LoadingImage.swift
//
//
//  Created by Zach Eriksen on 11/29/19.
//

import UIKit

@available(iOS 9.0, *)
public class LoadingImage: UIView {
    private var loadingTint: UIColor?
    private var errorHandler: ((LoadingImage?, Error?) -> Void)?
    private var completionHandler: ((UIImage?) -> Void)?
    
    public init(
        url: URL? = nil,
        loadingTint: UIColor? = nil,
        onErrorLoading: ((LoadingImage?, Error?) -> Void)? = nil,
        onCompletedLoading: ((UIImage?) -> Void)? = nil
    ) {
        
        super.init(frame: .zero)
        
        self.loadingTint = loadingTint
        errorHandler = onErrorLoading
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
    
    /// not implemented
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
            guard let data = data else {
                log(level: .error("Image \(#function) Error! Issue loading Image with url: \(url.absoluteString)", nil))
                
                self?.update(color: .systemRed)
                self?.errorHandler?(self, error)
                self?.completionHandler?(nil)
                return
            }
            guard let image = UIImage(data: data) else {
                log(level: .error("Image \(#function) Error! Issue loading Image with url: \(url.absoluteString). (Could not create UIImage from data)", nil))
                
                self?.update(color: .systemRed)
                self?.errorHandler?(self, error)
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
                log(level: .error("Image \(#function) Error! Issue loading Image: \(image). (Self was nil)", nil))
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
                log(level: .error("Image \(#function) Error! Issue loading Color: \(color). (Self was nil)", nil))
                return
            }
            self.clear()
                .embed {
                    Image(color: color)
                        .contentMode(self.contentMode)
                }
        }
    }
}
