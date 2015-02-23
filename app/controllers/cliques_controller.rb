class CliquesController < ApplicationController
  before_action :set_clique, only: [:show, :edit, :update, :destroy]
  

  def index
    @cliques = Clique.all
  end

  def show
    @user = current_user
  end

  def new
    @clique = Clique.new
  end

  def edit
  end

  def create
    @clique = Clique.new(clique_params)

    respond_to do |format|
      if @clique.save
        format.html { redirect_to @clique, notice: 'Clique was successfully created.' }
        format.json { render :show, status: :created, location: @clique }
      else
        format.html { render :new }
        format.json { render json: @clique.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @clique.update(clique_params)
        format.html { redirect_to @clique, notice: 'Clique was successfully updated.' }
        format.json { render :show, status: :ok, location: @clique }
      else
        format.html { render :edit }
        format.json { render json: @clique.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clique.destroy
    respond_to do |format|
      format.html { redirect_to cliques_url, notice: 'Clique was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join_clique
    user = User.find(params[:user_id])
    clique = Clique.find(params[:clique_id])
    clique.users << user
    clique.slambook.pages.create(title: "All About #{user.name_with_initial}.", page_type: "member")
    redirect_to cliques_path, notice: "Cool!  Now you're a member of #{clique.name}!"
  end

  private
    def set_clique
      @clique = Clique.find(params[:id])
    end

    def create_slambook
      @clique.slambook.create
    end

    def clique_params
      params.require(:clique).permit(:name, :queen_bee_id)
    end
end
