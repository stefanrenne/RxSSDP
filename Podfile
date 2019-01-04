# Uncomment the next line to define a global platform for your project

# Comment this line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'RxSSDP' do
  pod 'RxSwift', '~> 4.4'
end

target 'iOS Sample App' do
  platform :ios, '10.0'

  pod 'RxSwift', '~> 4.4'
  pod 'SwiftLint'
  pod 'RxSSDP', :path => '.'
end

target 'Mac Sample App' do
  platform :osx, '10.14'

  pod 'RxSwift', '~> 4.4'
  pod 'SwiftLint'
  pod 'RxSSDP', :path => '.'
end