class Vote < ActiveRecord::Base
  attr_accessible :choice, :email, :tocken, :validated

  validates :email, :uniqueness => true, :email => true

  def validate_email
    # email_domain = email.domain.to_s
  end
end
