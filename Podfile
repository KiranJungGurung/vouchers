# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ESEWA MARKET' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ESEWA MARKET
pod 'Alamofire'
#pod 'BottomSheet', :git => 'https://github.com/joomcode/BottomSheet'
pod 'SwiftyJSON', '~> 4.0'
pod 'Kingfisher', '~> 7.0'
#pod 'ObjectMapper'


end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end
