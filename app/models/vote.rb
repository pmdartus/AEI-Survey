class Vote < ActiveRecord::Base
  attr_accessible :choice, :email, :tocken, :validated

  validates :email, :uniqueness => true
end
