class ConfirmMailer < ActionMailer::Base
  default from: "logo@aei-insa.fr"

  def conf(vote)

    @vote = vote

    mail to: vote.email , subject: "Confirmation vote concours logo"
  end
end
