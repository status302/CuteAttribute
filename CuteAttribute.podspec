
Pod::Spec.new do |s|

  s.name         = "CuteAttribute"
  s.version      = "0.1.0"
  s.summary      = "A elegant way to use attributed string in swift."
  s.description  = <<-DESC
  A elegant way to deal with attributed string in swift. It's convenient to create attributed string by `.cute`, whatever from `String`, `NSString`, `NSAttributedString` or `NSMutableAttributedString`. It's so amazing that almost all method support `chaining`.
                   DESC

  s.homepage     = "https://github.com/qiuncheng/CuteAttribute"
  

  s.license      = "MIT"
  
  s.author       = { "qiuncheng" => "qiuncheng@gmail.com" }

  s.source       = { :git => "https://github.com/qiuncheng/CuteAttribute.git", :tag => "#{s.version}" }

  s.source_files = "CuteAttribute/*.{swift, h}"

end
