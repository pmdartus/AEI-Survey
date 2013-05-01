class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(params[:vote])
    email = @vote.email
    if (email.include? "insa-lyon") || (email.include? "insa-strasbourg") || (email.include? "insa-toulouse") || (email.include? "insa-rennes.fr")

      @vote.tocken = unique_identifier = SecureRandom.hex(7)
      
      if @vote.save
        redirect_to root_path, notice: 'Confirmation par mail envoye'
      else
        redirect_to root_path, notice: 'Une erreur inatendu est survenue'
      end
    else
      redirect_to root_path, notice: 'Veuillez enter une adresse INSA !'
    
    end
  end
end
