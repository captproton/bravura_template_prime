require_relative "lib/bravura_template_prime/version"

Gem::Specification.new do |spec|
  spec.name        = "bravura_template_prime"
  spec.version     = BravuraTemplatePrime::VERSION
  spec.authors     = [ "captproton" ]
  spec.email       = [ "carl@wdwhub.net" ]
  spec.homepage    = "https://github.com/captproton/bravura_template_prime"
  spec.summary     = "Prime template for Bravura blogging platform"
  spec.description = "BravuraTemplatePrime is a sleek and modern template engine for the Bravura blogging platform, offering customizable layouts and styles."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/captproton/bravura_template_prime"
  spec.metadata["changelog_uri"] = "https://github.com/captproton/bravura_template_prime/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.1"
  spec.add_dependency "bravura_template_base", "~> 0.1.0"
end
