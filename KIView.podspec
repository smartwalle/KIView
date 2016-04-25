Pod::Spec.new do |s|
  s.name         = "KIView"
  s.version      = "0.0.1"
  s.summary      = "KIView"
  s.description  = <<-DESC
                  KIView.
                   DESC
                   
  s.homepage     = "https://github.com/smartwalle/KIView"
  s.license      = "MIT"
  s.author       = { "SmartWalle" => "smartwalle@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/smartwalle/KIView.git", :tag => "#{s.version}"}
  s.source_files  = "KIView/KIView/**/*.{h,m}", "KIView/KIView/*.{h,m}"

  s.framework  = "UIKit"
  s.requires_arc = true
end
