Pod::Spec.new do |s|
  s.name     = 'BMYCircularProgressPullToRefresh'
  s.version  = '1.1.1'
  s.platform = :ios, '5.0'
  s.summary  = 'Pull to fresh with circular progress view as used in the Beamly iOS app.'
  s.description = 'This version of the pull to refresh feature can be used both on UITableViews and UICollectionViews. When dealing with a custom pull to refresh view, often the native UIRefreshControl is not ideal as it is not customizable. A common customization besides the pull to refresh, is to have a circular progress view with the logo of the app to show during the dragging. This version of the pull to refresh allows to preserve the contentInset on the scrollview.'
  s.homepage = 'https://github.com/beamly/BMYCircularProgressPullToRefresh'
  s.author   = { 'Alberto De Bortoli' => 'alberto@beamly.com', 'Stefan Dougan-Hyde' => 'stefan@beamly.com' }
  s.source   = { :git => 'https://github.com/beamly/BMYCircularProgressPullToRefresh.git', :tag => '1.1.1' }
  s.license      = { :type => 'New BSD License', :file => 'LICENSE.md' }
  s.source_files = ['BMYCircularProgressPullToRefresh/*.{h,m}','BMYCircularProgressPullToRefresh/**/*.{h,m}']
  s.requires_arc = true
end
