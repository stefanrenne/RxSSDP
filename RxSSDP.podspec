Pod::Spec.new do |spec|
  spec.name                   = 'RxSSDP'
  spec.version                = '5.0.3'
  spec.license                = { :type => 'Apache-2.0' }
  spec.homepage               = 'https://github.com/stefanrenne/RxSSDP'
  spec.authors                = { 'Stefan Renne' => 'info@stefanrenne.nl' }
  spec.summary                = 'A clean reactive SSDP client, based on UDPBroadcastConnection'
  spec.source                 = { :git => 'https://github.com/stefanrenne/RxSSDP.git', :tag => spec.version.to_s }
  spec.swift_version          = '5.0'
  spec.ios.deployment_target  = '10.0'
  spec.tvos.deployment_target  = '10.0'
  spec.osx.deployment_target  = '10.12'
  spec.watchos.deployment_target = '4.0'
  spec.requires_arc           = true
  spec.source_files           = 'RxSSDP/*.swift', 'RxSSDP/SwiftSSDPClient/*.swift'
  spec.dependency             'RxSwift', '~> 4.5'
end
