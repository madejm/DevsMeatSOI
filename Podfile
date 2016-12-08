platform :ios, '9.0'

target 'DevsMeat' do
  use_frameworks!

    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'
    pod 'Alamofire', '~> 4.0'
    pod 'AlamofireObjectMapper', '~> 4.0'
    pod 'SVProgressHUD'
    
    pod 'Moya/RxSwift', '8.0.0-beta.4'
    pod 'Moya-ModelMapper/RxSwift', '4.0.0-beta.3'
    pod 'RxOptional'
    
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
  end
