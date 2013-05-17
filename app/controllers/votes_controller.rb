class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(params[:vote])
    email = @vote.email
    if @vote.choice == nil
      redirect_to root_path, notice: 'Il faut quand meme choisir quelque chose pour voter =)'
    else
      if (email.include? "@insa-lyon") || (email.include? "@insa-strasbourg") || (email.include? "@etud.insa-toulouse") || (email.include? "@insa-rennes") || (email.include? "@insa-rouen") || (email.include? '@ensi-bourges') || (email.include? '@etu.enivl')

        begin
          tocken_secret = unique_identifier = SecureRandom.hex(7)
        end while Vote.exists?(:tocken => tocken_secret)

        @vote.tocken = tocken_secret
        @vote.validated = false
        
        if @vote.save
          ConfirmMailer.conf(@vote).deliver
          redirect_to root_path, notice: 'Confirmation par mail envoye'
        else
          find_vote = Vote.find_by_email( @vote.email )
          if find_vote != nil && find_vote.validated == false 
            find_vote.choice = @vote.choice
            find_vote.tocken = tocken_secret
            find_vote.save
            ConfirmMailer.conf(@vote).deliver
            redirect_to root_path, notice: "Vote mis a jours"
          else
            redirect_to root_path, alert: "L'adresse a deja ete utilisee !"
          end
        end

      else
        redirect_to root_path, alert: 'Veuillez entrer une adresse INSA !'
      end      
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
