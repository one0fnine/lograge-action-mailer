lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lograge/action_mailer/version"

Gem::Specification.new do |spec|
  spec.name = "lograge-action-mailer"
  spec.version = Lograge::ActionMailer::VERSION
  spec.authors = ["Pervushin Alec"]
  spec.email = ["pervushin.oa@gmail.com"]

  spec.summary = "Lograge for ActionMailer."
  spec.description = "Lograge for ActionMailer."
  spec.homepage = "https://github.com/one0fnine/lograge-action-mailer"
  spec.license = "MIT"

  spec.files = Dir["lib/**/*", "Rakefile", "README.md"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.add_runtime_dependency "actionmailer", ">= 5", "< 7.1"
  spec.add_runtime_dependency "lograge", "> 0.11"

  spec.add_development_dependency "rake", ">= 12.3.3"
end
