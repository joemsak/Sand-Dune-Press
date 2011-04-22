Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-comics'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Comics engine for Refinery CMS'
  s.date              = '2011-04-21'
  s.summary           = 'Comics engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
