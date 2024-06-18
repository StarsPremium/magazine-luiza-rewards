# frozen_string_literal: true

require_relative 'lib/magazine_luiza_rewards_v2/version'

Gem::Specification.new do |spec|
  spec.name = 'magazine_luiza_rewards_v2'
  spec.version = MagazineLuizaRewardsV2::VERSION
  spec.authors = ['Ronaldo de Sousa Araujo']
  spec.email = ['contato@ronaldoaraujo.eti.br']

  spec.summary = 'Integration with the rewards program of Magazine Luiza'
  spec.homepage = 'https://github.com/StarsPremium/magazine-luiza-rewards'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.8'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-core', '1.0'
  spec.add_dependency 'dry-struct', '~> 1.6'
  spec.add_dependency 'faraday', '~> 2.7'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
