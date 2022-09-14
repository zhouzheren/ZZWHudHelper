#
# Be sure to run `pod lib lint ZZWHudHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZZWHudHelper'
  s.version          = '0.1.0'
  s.summary          = '封装MBProgressHUD，简化使用.'
  s.homepage         = 'https://github.com/zhouzheren/ZZWHudHelper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'snail' => 'a595429717@163.com' }
  s.source           = { :git => 'https://github.com/zhouzheren/ZZWHudHelper.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'ZZWHudHelper/Classes/**/*'
  s.dependency 'MBProgressHUD','~> 0.9.2' #需要依赖的三方库
end
