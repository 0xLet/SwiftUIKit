Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "SwiftUIKit_ccpods"
s.summary = "UIKit implementation of SwiftUI"
s.requires_arc = true
s.swift_version = '5.0'

s.version = "1.0.0.10.3"

s.license = { :type => 'MIT' }
s.author = { "Zach Eriksen" => "zmeriksen@icloud.com" }
s.homepage = "https://github.com/zmeriksen/SwiftUIKit"
s.source = { :git => "https://github.com/zmeriksen/SwiftUIKit.git", :tag => "#{s.version}"}

s.ios.framework = "UIKit"
s.source_files = "Sources/**/*.swift"

end
