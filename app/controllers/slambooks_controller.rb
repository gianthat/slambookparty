class SlambooksController < ApplicationController
  before_action :set_slambook, only: [:show, :edit, :update, :destroy]

  def index
    @slambooks = Slambook.all
  end

  def show
    @first_page = @slambook.pages_in_order[0]
  end

  def new
    @slambook = Slambook.new
  end

  def edit
  end

  def create
    @slambook = Slambook.new(slambook_params)

    respond_to do |format|
      if @slambook.save
        format.html { redirect_to @slambook, notice: 'Slambook was successfully created.' }
        format.json { render :show, status: :created, location: @slambook }
      else
        format.html { render :new }
        format.json { render json: @slambook.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @slambook.update(slambook_params)
        format.html { redirect_to @slambook, notice: 'Slambook was successfully updated.' }
        format.json { render :show, status: :ok, location: @slambook }
      else
        format.html { render :edit }
        format.json { render json: @slambook.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @slambook.destroy
    respond_to do |format|
      format.html { redirect_to slambooks_url, notice: 'Slambook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_slambook
      @slambook = Slambook.find(params[:id])
    end


    def slambook_params
      params.require(:slambook).permit(:clique_id)
    end
end
