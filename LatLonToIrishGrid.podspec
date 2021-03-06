#
# Be sure to run `pod lib lint LatLonToIrishGrid.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LatLonToIrishGrid'
  s.version          = '0.1.0'
  s.summary          = 'Convert Latitude and Longitude to Irish Grid Reference (EPSG:29903)'

# This description is used to generate tags and improve search results.
#   Convert Latitude and Longitude to Irish Grid Reference (EPSG:29903)

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/paulsusername/LatLonToIrishGrid'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'paulsusername' => 'paul@hiiker.co' }
  s.source           = { :git => 'https://github.com/paulsusername/LatLonToIrishGrid.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'LatLonToIrishGrid/Classes/**/*'
  
   s.resource_bundles = {
     'LatLonToIrishGrid' => ['LatLonToIrishGrid/Assets/*.js']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'CoreLocation', 'JavaScriptCore'
  # s.dependency 'AFNetworking', '~> 2.3'
end
