class PartsController < ApplicationController

def new
  @part = Part.new
end

def create
  @car = Car.find(params[:car_id].to_i)
  @part = Part.create(part_params)
  @car.parts << @part
  redirect_to car_path(@car.id)
end

  # parts GET    /parts(.:format)          parts#index
  #         POST   /parts(.:format)          parts#create
  # new_part GET    /parts/new(.:format)      parts#new
  # edit_part GET    /parts/:id/edit(.:format) parts#edit
  #    part GET    /parts/:id(.:format)      parts#show
  #         PATCH  /parts/:id(.:format)      parts#update
  #         PUT    /parts/:id(.:format)      parts#update
  #         DELETE /parts/:id(.:format)      parts#destroy

private

  def part_params
    params.require(:part).permit(:name, :part_type, :part_number, :repair_details)
  end

end
