class CarsController < ApplicationController

def index
  @cars = Cars.all
end

def show
  @car = Cars.find(params[:id])
end

def new
  @car = Cars.new
end

def create
  @car = Cars.create(car_params)
  redirect_to cars_path
end

def destroy
  car = Cars.find(params[:id])
  car.delete
  redirect_to cars_path
end

#           POST   /cars(.:format)           cars#create
#   new_car GET    /cars/new(.:format)       cars#new
#  edit_car GET    /cars/:id/edit(.:format)  cars#edit
#       car GET    /cars/:id(.:format)       cars#show
#           PATCH  /cars/:id(.:format)       cars#update
#           PUT    /cars/:id(.:format)       cars#update
#           DELETE /cars/:id(.:format)       cars#destroy

private

def car_params
  params.require(:cars).permit(:name, :VIN, :make, :model)
end

end


