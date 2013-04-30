class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(params[:vote])
    if @vote.save
      redirect_to root_path, notice: 'Confirmation par mail envoye'
    else
      redirect_to root_path, notice: 'Une erreur inatendu est survenue'
    end
  end
end
