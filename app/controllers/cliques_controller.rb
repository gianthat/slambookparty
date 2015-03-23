class CliquesController < ApplicationController
 before_action :set_clique, only: [:show, :edit, :update, :destroy, :join, :join_clique, :leave_clique]
   after_action :verify_authorized

    # respond_to :json

  def index
    @cliques = Clique.all
    @current_cliques = current_user.cliques.all
    @unjoined_cliques = Clique.all - @current_cliques
    authorize @cliques

     # respond_with Clique.all
  end

  def join
    @cliques = Clique.all
    # @clique = Clique.find(params[:id])
  end

  def show
    @user = current_user
  end

  def new
    @clique = Clique.new
    authorize @clique
  end

  def edit
  end

  def create
    @clique = Clique.new(clique_params)
    authorize @clique
    respond_to do |format|
      if @clique.save
        format.html { redirect_to @clique, notice: 'Yay, the clique has been created!' }
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
        format.html { redirect_to @clique, notice: 'Great, the clique was edited.' }
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
      format.html { redirect_to homeroom_user_path(current_user), notice: 'Clique was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join_clique
    @user = User.find(params[:user_id])
    password_attempt = params[:password_attempt].gsub(/\s+/, "").downcase
    if password_attempt == @clique.password.gsub(/\s+/, "").downcase
      @clique.users << @user
      unless @clique.slambook.pages.where(title: "All About #{@user.name_with_initial}.").exists?
        @clique.slambook.pages.create(title: "All About #{@user.name_with_initial}.", page_type: "member")
      end
      redirect_to homeroom_user_path(@user), notice: "Cool!  Now you're a member of #{@clique.name}!"
    else
      redirect_to :back, notice: "That's not the right password. If you don't know it ask #{@clique.queen_bee.first_name}"
    end
  end

  def leave_clique
    @user = User.find(params[:user_id])
    @clique.users.delete(@user)
    redirect_to homeroom_user_path(@user), notice: "Good riddance. You didn't need them anyway!"
  end

  private
    def set_clique
      @clique = Clique.find(params[:id])
      authorize @clique
    end

    def create_slambook
      @clique.slambook.create
    end

    def clique_params
      params.require(:clique).permit(:name, :queen_bee_id, :password, :password_confirmation, :clue)
    end
end
