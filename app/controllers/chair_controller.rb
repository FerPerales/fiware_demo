class ChairController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @chairs = Chair.all
  end

  def update
    @chair = Chair.find(chair_params['id']) || Chair.new
    @chair.status = status_value
    if @chair.save
      message = @chair.status ? 'Seat taken' : 'A new seat is available'
      redirect_to :root, flash: { message: message }
    else
      redirect_to :root, flash: { message: "Error"}
    end

  end

  private

  def chair_params
    params['contextResponses'][0]['contextElement']
  end

  def status_value
    chair_params['attributes'][0]['value']
  end

end
