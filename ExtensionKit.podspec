#
# Be sure to run `pod lib lint ExtensionKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ExtensionKit'
  s.version          = '0.1.0'
  s.summary          = 'The ExtensionKit is a common extensions of Swift.'
  s.description      = <<-DESC
                        The ExtensionKit is a collection of common extensions for iOS projects of Swift .
                       DESC

  s.homepage         = 'https://github.com/Tuluobo/ExtensionKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tuluobo' => 'tuluobo@vip.qq.com' }
  s.source           = { :git => 'https://github.com/Tuluobo/ExtensionKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Tuluobo'

  s.ios.deployment_target = '9.0'
  s.source_files = 'ExtensionKit/Classes/**/*'

  s.static_framework = true
  s.swift_version = '4.0'
end
