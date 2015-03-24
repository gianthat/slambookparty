class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized


  def index
    @pages = Page.all.order(:slambook_id)
    respond_to do |format|
      format.json {render json: @pages }
    end
    authorize @pages
  end

  def show
    @entry = Entry.new
    @entries = @page.entries
    @next_page = @page.next
    @previous_page = @page.previous
    respond_to do |format|
      format.json {render json: @page }
    end
  end

  def react_show
    @page = Page.find(params[:id])
    authorize @page
    @entry = Entry.new
    @next_page = @page.next
    @previous_page = @page.previous
  end

  def new
    @page = Page.new
    @slambook = Slambook.find_by(id: params[:slambook_id])
    authorize @page
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    authorize @page
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_page
      @page = Page.find(params[:id])
      authorize @page
    end


    def page_params
      params.require(:page).permit(:slambook_id, :page_type, :title)
    end
end
