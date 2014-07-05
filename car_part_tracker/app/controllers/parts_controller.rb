class PartsController < ApplicationController

def show
  @car = Car.find(params[:car_id])
  @part = Part.find(params[:id])
end

def new
  @part = Part.new
  @car = Car.find(params[:car_id])
end

def create
  @car = Car.find(params[:car_id])
  @part = Part.create(part_params)
  @car.parts << @part
  redirect_to car_path(@car.id)
end

def edit
  @part = Part.find(params[:id])
  @car = Car.find(params[:car_id])
end

def update
  @part = Part.find(params[:id])
  @car = Car.find(params[:car_id])
  @part.update(part_params)
  redirect_to car_path(@car.id)
end

def destroy
  car = Car.find(params[:car_id])
  part = Part.find(params[:id])
  part.destroy
  redirect_to car_path(car.id)
end

private

  def part_params
    params.require(:part).permit(:name, :part_type, :part_number, :repair_details)
  end

end
