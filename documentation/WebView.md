# WebView

``` swift
@available(iOS 9.0, *) public class WebView: WKWebView
```

## Inheritance

`WKWebView`

## Initializers

### `init()`

``` swift
public init()
```

### `init(baseURL:htmlString:)`

``` swift
convenience init(baseURL: URL? = nil, htmlString: () -> String)
```

### `init(url:)`

``` swift
convenience init(url: URL)
```

### `init(request:)`

``` swift
convenience init(request: URLRequest)
```

### `init(URL:allowingReadAccessTo:)`

``` swift
convenience init(URL: URL, allowingReadAccessTo readAccessURL: URL)
```

### `init(data:mimeType:characterEncodingName:baseURL:)`

``` swift
convenience init(data: Data, mimeType MIMEType: String, characterEncodingName: String, baseURL: URL)
```

## Methods

### `loadHTMLString(baseURL:htmlString:)`

``` swift
@discardableResult func loadHTMLString(baseURL: URL? = nil, htmlString: () -> String) -> Self
```

### `load(url:)`

``` swift
@discardableResult func load(url: URL) -> Self
```

### `load(request:)`

``` swift
@discardableResult func load(request: URLRequest) -> Self
```

### `loadFile(URL:allowingReadAccessTo:)`

``` swift
@discardableResult func loadFile(URL: URL, allowingReadAccessTo readAccessURL: URL) -> Self
```

### `load(data:mimeType:characterEncodingName:baseURL:)`

``` swift
@discardableResult func load(data: Data, mimeType MIMEType: String, characterEncodingName: String, baseURL: URL) -> Self
```

### `set(uiDelegate:)`

``` swift
@discardableResult func set(uiDelegate delegate: WKUIDelegate) -> Self
```

### `set(navigationDelegate:)`

``` swift
@discardableResult func set(navigationDelegate delegate: WKNavigationDelegate) -> Self
```
