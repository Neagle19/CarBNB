class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
    # Added to validate method (TZ + SN)
end
