class PokemonController < ApplicationController
  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer = current_trainer
    @pokemon.save
    redirect_to root_path
  end

  def damage
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.health <= 0
      @pokemon.destroy
    else
      @pokemon.health -= 10
      @pokemon.save
    end
    redirect_to @pokemon.trainer
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.create(pokemon_param)
    @pokemon.health = 100
    @pokemon.level = 1
    @pokemon.trainer = current_trainer
    if @pokemon.save
      redirect_to @pokemon.trainer
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      render "new"
    end
  end

  def pokemon_param
    params.require(:pokemon).permit(:name)
  end

  end