class ChairController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @chairs = Chair.all
  end

  def update
    begin
      @chair = Chair.find(chair_params['id'])
    rescue Exception
      @chair = Chair.new
    end

    if @chair.update_attribute :status, status_value
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
