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
  s.source       = { :git => "https://github.com/smartwalle/KIView.git", :branch => "master",  :submodules => true }
  s.source_files  = "KIView/KIView/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  s.framework  = "UIKit"
  s.requires_arc = true
 
  s.subspec 'KIActionSheet' do |ss|
    ss.source_files  = "KIView/KIView/KIActionSheet/*.{h,m}"
  end

  s.subspec 'KIAlertView' do |ss|
    ss.source_files  = "KIView/KIView/KIAlertView/*.{h,m}"
  end

  s.subspec 'KIButton' do |ss|
    ss.source_files  = "KIView/KIView/KIButton/*.{h,m}"
  end

  s.subspec 'KIImageView' do |ss|
    ss.source_files  = "KIView/KIView/KIImageView/*.{h,m}"
  end

  s.subspec 'KITextField' do |ss|
    ss.source_files  = "KIView/KIView/KITextField/*.{h,m}"
  end
  s.subspec 'KITextView' do |ss|
    ss.source_files  = "KIView/KIView/KITextView/*.{h,m}"
  end
end
