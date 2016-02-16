class Url < ActiveRecord::Base
  validates :long_url , presence: true
end
