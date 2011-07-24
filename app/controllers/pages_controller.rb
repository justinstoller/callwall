class PagesController < ApplicationController
  def home
  end

  def search
    @people = Person.joins(:zipcodes).where('zipcodes.number' => params[:zip])
    respond_to do |format|
      format.json { render :json => @people }
    end
  end
end
