# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'appFinalFranSalas' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for appFinalFranSalaso
  pod 'Alamofire'
  pod 'AlamofireImage'
  
  #problemas a la hora de procesar svgs de banderas
  #https://stackoverflow.com/questions/35691839/how-to-display-svg-image-using-swift/38152144
  pod 'SVGKit' , :git => 'https://github.com/SVGKit/SVGKit.git', :branch => '3.x'
  
  pod "Macaw", "0.9.4"

  target 'appFinalFranSalasTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'appFinalFranSalasUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
