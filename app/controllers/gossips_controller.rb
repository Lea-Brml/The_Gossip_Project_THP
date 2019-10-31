class GossipsController < ApplicationController

  include SessionsHelper
  before_action :authenticate_user, only: [:new, :create, :show, :edit, :destroy]



  def authenticate_user

    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end

  end



  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossip = Gossip.all
    @user = User.all

  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.all
    @user = User.all

  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = current_user
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    @gossip = Gossip.new(user_id: session[:user_id], title: params[:title], content: params[:content])

    if @gossip.save
      flash[:success]
      redirect_to gossips_path
    else
      flash[:danger]
      render 'gossips/new'
    end

  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip = Gossip.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

    @gossippp = Gossip.find(params[:id])

      unless compare_user(session[:user_id], @gossippp.user_id) == false

        if @gossippp.update(title: params[:title], content: params[:content])
          redirect_to gossips_path
        else
          render :edit
        end

      end

  end


  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossipp = Gossip.find(params[:id])

    unless compare_user(session[:user_id], @gossipp.user_id) == false

      if @gossipp.destroy
        redirect_to gossips_path
      else
        render :show
      end

    end

  end


  def compare_user(session_id, user_id)

    return session_id == user_id

  end


end
