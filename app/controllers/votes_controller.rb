class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(params[:vote])
    email = @vote.email
    if (email.include? "@insa-lyon") || (email.include? "@insa-strasbourg") || (email.include? "@etud.insa-toulouse") || (email.include? "@insa-rennes.fr")

      begin
        tocken_secret = unique_identifier = SecureRandom.hex(7)
      end while Vote.exists?(:tocken => tocken_secret)

      @vote.tocken = tocken_secret
      @vote.validated = false
      
      if @vote.save
        ConfirmMailer.conf(@vote).deliver
        redirect_to root_path, notice: 'Confirmation par mail envoye'
      else
        redirect_to root_path, alert: 'Une erreur inatendu est survenue'
      end

    else
      redirect_to root_path, alert: 'Veuillez enter une adresse INSA !'
    end

  end

  def validate
    tocken = params[:tocken]
    vote = Vote.find_by_tocken(tocken)
    if vote

      if !vote.validated
        vote.validated = true
        vote.save
        redirect_to root_path, notice: "Le vote a ete confirme"
      else
        redirect_to root_path, alert: "Le vote a deja ete confirme !"
      end

    else
      redirect_to root_path, alert: "Confirmation invalide !"
    end

  end
end
