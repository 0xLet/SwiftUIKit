//
//  WebView.swift
//  
//
//  Created by Zach Eriksen on 11/27/19.
//

import WebKit

@available(iOS 9.0, *)
public class WebView: WKWebView {
    public init() {
        let configuration = WKWebViewConfiguration()
        
        super.init(frame: .zero, configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 9.0, *)
public extension WebView {
    convenience init(baseURL: URL? = nil, _ htmlString: () -> String) {
        self.init()
        
        loadHTMLString(baseURL: baseURL, htmlString)
    }
    
    
    convenience init(url: URL) {
        self.init()
        
        load(url: url)
    }
    
    convenience init(request: URLRequest) {
        self.init()
        
        load(request: request)
    }
    
    convenience init(URL: URL, allowingReadAccessTo readAccessURL: URL) {
        self.init()
        
        loadFile(URL: URL, allowingReadAccessTo: URL)
    }
    
    convenience init(data: Data, mimeType MIMEType: String, characterEncodingName: String, baseURL: URL) {
        self.init()
        
        load(data: data, mimeType: MIMEType, characterEncodingName: characterEncodingName, baseURL: baseURL)
    }
    
    @discardableResult
    func loadHTMLString(baseURL: URL? = nil, _ htmlString: () -> String) -> Self {
        
        loadHTMLString(htmlString(), baseURL: baseURL)
        
        return self
    }
    
    @discardableResult
    func load(url: URL) -> Self {
        
        load(URLRequest(url: url))
        
        return self
    }
    
    @discardableResult
    func load(request: URLRequest) -> Self {
        
        load(request)
        
        return self
    }
    
    @discardableResult
    func loadFile(URL: URL, allowingReadAccessTo readAccessURL: URL) -> Self {
        
        loadFileURL(URL, allowingReadAccessTo: readAccessURL)
        
        return self
    }
    
    @discardableResult
    func load(data: Data, mimeType MIMEType: String, characterEncodingName: String, baseURL: URL) -> Self {
        
        load(data, mimeType: MIMEType, characterEncodingName: characterEncodingName, baseURL: baseURL)
        
        return self
    }
    
    @discardableResult
    func set(uiDelegate delegate: WKUIDelegate) -> Self {
        
        
        uiDelegate = delegate
        
        return self
    }
    
    @discardableResult
    func set(navigationDelegate delegate: WKNavigationDelegate) -> Self {
        
        
        navigationDelegate = delegate
        
        return self
    }
}
