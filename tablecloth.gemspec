$:.push File.expand_path("../lib", __FILE__)
require "tablecloth/version"

spec = Gem::Specification.new do |s|

     s.name = "tablecloth"
     s.version = TC::VERSION
     s.platform    = Gem::Platform::RUBY
     s.summary = "A text parser to turn plain text into ingredient objects"
     s.description = "A text parser to turn plain text into ingredients object and html"
     s.files = Dir.glob("**/**/**/**")
     s.test_files = Dir.glob("test/*_test.rb")
     s.authors = ["Mikey Hogarth"]
     s.homepage = "https://github.com/mikeyhogarth/tablecloth"
     s.email = "mikehogarth20@hotmail.com"
     s.has_rdoc = false
     s.required_ruby_version = ">= 1.8.2"
     s.licenses = "gpl-2"
end