module Doorkeeper
  class Application < ActiveRecord::Base
    self.table_name = :oauth_applications
  end
end
