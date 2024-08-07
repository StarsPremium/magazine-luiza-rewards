# frozen_string_literal: true

require 'magazine_luiza_rewards_v2'
require 'rspec/dry/struct'
require 'active_support/all'

support_dir = "#{MagazineLuizaRewardsV2.root}/spec/support/**/*.rb"
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
