# Uncomment the next line to define a global platform for your project
# platform :ios, '14.0'

target 'TopNewsApplication' do
  # add pods here
end

# -----------------------
post_install do |installer|
  installer.pods_project.targets.each do |target|
    minimum_target = '14.0'
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = minimum_target
      
      if config.base_configuration_reference
        xcconfig_path = config.base_configuration_reference.real_path
        xcconfig = File.read(xcconfig_path)
        xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
        File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
      end
    end
  end
end
