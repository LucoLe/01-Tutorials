class Subscription < ActiveRecord::Base
  has_one :user, class_name: User.name, foreign_key: "subscription_id"
end
