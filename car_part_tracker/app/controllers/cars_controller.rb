class CarsController < ApplicationController

def index
  @cars = Car.all
end

def show
  @car = Car.find(params[:id])
  # @parts = @car.parts.all
end

def new
  @car = Car.new
end

def create
  @car = Car.create(car_params)
  redirect_to cars_path
end

def edit
  @car = Car.find(params[:id])
end

def update
  car = Car.find(params[:id])
  car.update(car_params)
  redirect_to car_path(car.id)
end

def destroy
  car = Car.find(params[:id])
  car.delete
  redirect_to cars_path
end

private

  def car_params
    params.require(:car).permit(:name, :VIN, :make, :model)
  end

end


