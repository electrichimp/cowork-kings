class CoworkingsController < ApplicationController
  def new
    @coworking = Coworking.new
  end

  def create
    @coworking = Coworking.new(coworking_params)
    @coworking.user = current_user
    if @coworking.save
      redirect_to coworking_path(@coworking)
    else
      render :new
    end
  end

  def show
    @coworking = Coworking.find(params[:id])
  end

  private

  def coworking_params
    params.require(:coworking).permit(:name, :address, :description, :price, :capacity)
  end
end
