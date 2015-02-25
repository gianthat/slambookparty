class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized


  def index
    @entries = Entry.all
    authorize @entries
  end

  def show
  end

  def new
    @entry = Entry.new
    authorize @entry
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    authorize @entry
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry.page }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to page_path(@entry.page), notice: 'Your entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_entry
      @entry = Entry.find(params[:id])
      authorize @entry
    end

    def entry_params
      params.require(:entry).permit(:user_id, :page_id, :content, :anonymous)
    end
end
