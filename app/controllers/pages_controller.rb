class PagesController < ApplicationController
  require 'open-uri'
  include OpenURI

  def home
  end

  def search
    @people = Person.joins(:zipcodes).where('zipcodes.number' => params[:zip]).includes(:contacts)
    respond_to do |format|
      format.json { render :json => @people.to_json(:include => :contacts) }
    end
  end

  def call
    open("http://api.speek.com/calls/callNow?organizer=#{params[:numbers]}&format=json&numbers=1#{params[:organizer]}&api_key=rurw7tdq28r2xurrtyxb65wv&description=ACallWallDemo")
  end
end
