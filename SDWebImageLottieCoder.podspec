#
# Be sure to run `pod lib lint SDWebImageLottieCoder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SDWebImageLottieCoder'
  s.version          = '0.1.0'
  s.summary          = 'A SDWebImage coder plugin for Lottie animation'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A Lottie animation coder which use SDAnimatedImageView instead of LOTAnimationView for bitmap rendering.
                       DESC

  s.homepage         = 'https://github.com/SDWebImage/SDWebImageLottieCoder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DreamPiggy' => 'lizhuoli1126@126.com' }
  s.source           = { :git => 'https://github.com/SDWebImage/SDWebImageLottieCoder.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'SDWebImageLottieCoder/Classes/**/*', 'SDWebImageLottieCoder/Module/SDWebImageLottieCoder.h'
  
  s.dependency 'SDWebImage', '~> 5.6'
  s.dependency 'librlottie', '~> 0.1'
end
