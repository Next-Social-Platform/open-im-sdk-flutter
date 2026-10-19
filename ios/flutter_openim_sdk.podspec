#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_openim_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_openim_sdk'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # s.dependency 'OpenIMSDKCore','3.8.1'
  s.static_framework = true
  s.library = 'resolv'

  # Built from openim-sdk-core with `make flutter-ios`
  s.vendored_frameworks = 'Framework/OpenIMCore.xcframework'
  # Flutter.framework does not contain a i386 slice.
  # CONFIRMED (2026.09.25): OpenIMSDKCore 3.8.1 ships no arm64-iOS-simulator slice.
  # Dropping arm64 from this exclusion (tried once) does NOT make simulator builds
  # work — it just trades Xcode's upfront "no destination matches" complaint for a
  # harder-to-read `#error unsupported Swift architecture` in the generated
  # -Swift.h, because the plugin's own Swift wrapper then also can't be compiled for
  # arm64 simulator. Keep arm64 excluded here; run this app on a physical device
  # instead of the simulator until an OpenIMSDKCore release adds Apple Silicon
  # simulator support.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 arm64' }
  s.swift_version = '5.0'
end
