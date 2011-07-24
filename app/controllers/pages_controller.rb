class PagesController < ApplicationController
  def home
  end

  def search
    @people = Person.joins(:zipcodes).where('zipcodes.number' => params[:zip]).includes(:contacts)
    respond_to do |format|
      format.json { render :json => @people.to_json(:include => :contacts) }
    end
  end
end
