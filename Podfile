# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'LetChat' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LetChat
pod 'Firebase/Core'
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
pod 'Firebase/Storage'
pod 'Firebase/Analytics'
pod 'Firebase/Messaging'
post_install do |installer|
        installer.pods_project.build_configurations.each do |config|
          config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
        end
      end
end

