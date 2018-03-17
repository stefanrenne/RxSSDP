Pod::Spec.new do |spec|
  spec.name         = 'RxSSDP'
  spec.version      = '4.0.0'
  spec.license      = { :type => 'Apache-2.0' }
  spec.homepage     = 'https://github.com/stefanrenne/RxSSDP'
  spec.authors      = { 'Stefan Renne' => 'info@stefanrenne.nl' }
  spec.summary      = 'An Reactive SSDP client with buffering written in Swift, based on SwiftSSDPClient'
  spec.source       = { :git => 'https://github.com/stefanrenne/RxSSDP.git', :tag => '4.0.0', :submodules => true }
  spec.ios.deployment_target  = '8.0'
  spec.source_files       = 'Sources/SwiftSSDPClient/Sources/*.swift', 'Sources/*.swift'
  spec.framework    = 'SystemConfiguration'
  spec.dependency 'RxSwift', '~> 4.0'
  spec.dependency 'RxCocoa', '~> 4.0'
  spec.dependency 'CocoaAsyncSocket', '~> 7.6'
end