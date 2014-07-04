class CarsController < ApplicationController

def index
  @cars = Cars.all
end

def new
  @car = Cars.new
end

#           POST   /cars(.:format)           cars#create
#   new_car GET    /cars/new(.:format)       cars#new
#  edit_car GET    /cars/:id/edit(.:format)  cars#edit
#       car GET    /cars/:id(.:format)       cars#show
#           PATCH  /cars/:id(.:format)       cars#update
#           PUT    /cars/:id(.:format)       cars#update
#           DELETE /cars/:id(.:format)       cars#destroy

end


