RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  #config.include Requests::Helpers, type: :request
  #config.include Devise::Test::ControllerHelpers, type: :view
end
