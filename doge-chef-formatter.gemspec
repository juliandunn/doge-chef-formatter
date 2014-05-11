$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "doge-chef-formatter"
  s.version     = "0.0.1"
  s.authors     = ["Julian C. Dunn"]
  s.email       = ["jdunn@getchef.com"]
  s.homepage    = "https://github.com/juliandunn/doge-chef-formatter"
  s.summary     = %q{Doge Chef log formatter}
  s.description = %q{Much resources. So log. Wow.}

  s.rubyforge_project = "doge-chef-formatter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
