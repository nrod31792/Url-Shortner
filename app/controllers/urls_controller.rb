class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]
  def index
    @urls = Url.all
  end

  def show
    @urls = Url.find(params[:id])
    redirect_to "#{@url.long_url}"
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
      respond_to do |format|
        if @url.save
          format.html { redirect_to urls_path, notice: 'Url was successfully created.' }
        else
          format.html { render :new }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to urls_path, notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to url_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
  end


  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end

  def set_url
    @url = Url.find(params[:id])
  end
end
