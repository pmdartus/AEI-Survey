class Vote < ActiveRecord::Base
  attr_accessible :choice, :email, :tocken, :validated
  validate :email, :uniqueness => :true
end
