# frozen_string_literal: true

require 'magazine_luiza_rewards'
require 'rspec/dry/struct'

support_dir = "#{MagazineLuizaRewards.root}/spec/support/**/*.rb"
Dir[support_dir].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
