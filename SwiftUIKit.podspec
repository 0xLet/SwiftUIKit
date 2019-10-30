Pod::Spec.new do |s|
# 1
s.platform = :ios
s.ios.deployment_target = '9.0'
s.name = "SwiftUIKit"
s.summary = "UIKit implementation of SwiftUI"
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => 'MIT' }

# 4
s.author = { "Zach Eriksen" => "zmeriksen@icloud.com" }

# 5
s.homepage = "https://github.com/zmeriksen/SwiftUIKit"

# 6
s.source = { :git => "https://github.com/zmeriksen/SwiftUIKit.git", :tag => "#{s.version}"}

# 7
s.ios.framework = "UIKit"

# 8
s.source_files = "SwiftUIKit/**/*.{swift}"
end
