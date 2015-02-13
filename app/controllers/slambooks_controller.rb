class SlambooksController < ApplicationController
  before_action :set_slambook, only: [:show, :edit, :update, :destroy]

  # GET /slambooks
  # GET /slambooks.json
  def index
    @slambooks = Slambook.all
  end

  # GET /slambooks/1
  # GET /slambooks/1.json
  def show
  end

  # GET /slambooks/new
  def new
    @slambook = Slambook.new
  end

  # GET /slambooks/1/edit
  def edit
  end

  # POST /slambooks
  # POST /slambooks.json
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

  # PATCH/PUT /slambooks/1
  # PATCH/PUT /slambooks/1.json
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

  # DELETE /slambooks/1
  # DELETE /slambooks/1.json
  def destroy
    @slambook.destroy
    respond_to do |format|
      format.html { redirect_to slambooks_url, notice: 'Slambook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slambook
      @slambook = Slambook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slambook_params
      params.require(:slambook).permit(:name)
    end
end
