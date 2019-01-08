# Uncomment the next line to define a global platform for your project

# Comment this line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'RxSSDP' do
  pod 'RxSwift', '~> 4.4'
  pod 'SwiftLint'

  target 'RxSSDPTests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 4.4'
  end
end

target 'iOS Sample App' do
  platform :ios, '10.0'

  pod 'RxSwift', '~> 4.4'
  pod 'RxSSDP', :path => '.'
end

target 'Mac Sample App' do
  platform :osx, '10.14'

  pod 'RxSwift', '~> 4.4'
  pod 'RxSSDP', :path => '.'
end

target 'TV Sample App' do
  platform :tvos, '12.0'

  pod 'RxSwift', '~> 4.4'
  pod 'RxSSDP', :path => '.'
end

target 'Watch Sample App' do
end

target 'Watch Sample App Extension' do

  pod 'RxSwift', '~> 4.4'
  pod 'RxSSDP', :path => '.'
end