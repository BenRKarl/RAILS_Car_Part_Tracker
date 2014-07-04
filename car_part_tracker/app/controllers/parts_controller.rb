class PartsController < ApplicationController

def new
  @part = Parts.new
end

def create
  binding.pry
  car = Cars.find(params[:id])
  part = Part.create(part_params)
  car.parts << part
  redirect_to car_path
end

  # parts GET    /parts(.:format)          parts#index
  #         POST   /parts(.:format)          parts#create
  # new_part GET    /parts/new(.:format)      parts#new
  # edit_part GET    /parts/:id/edit(.:format) parts#edit
  #    part GET    /parts/:id(.:format)      parts#show
  #         PATCH  /parts/:id(.:format)      parts#update
  #         PUT    /parts/:id(.:format)      parts#update
  #         DELETE /parts/:id(.:format)      parts#destroy

end
