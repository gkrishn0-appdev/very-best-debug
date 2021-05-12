class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def show
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id })
    the_venue = matching_venues
    @venue=the_venue
    p "HERERERERERERERERE"
    p "VENUEVENUEVENUE" 
    p @venue
    p "DONE"
    p @venue.at(0).address
    p "DONE"
    @venue = @venue.at(0)
    @the_venue = @venue
    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    @venue = Venue.new
    @venue.address = params.fetch("query_address")
    #@venue.address = "test"
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    @venue.save

    #render({ :template => "/venues/#{@venue.name}" })
    #redirect_to("/venues/#{@venue.name}")
    redirect_to("/venues/")
  end
  
  def update
    the_id = params.fetch("venue_id")

    @venue = Venue.where({ :id => the_id }).at(0)
    p "HEREHERERE"
    p params.fetch("query_address")
    p "AFTER"
 
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    @venue.save
    
    redirect_to("/venues/#{@venue.id}")
  end

  def destroy
    the_id = params.fetch("id_to_delete")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues
    venue.destroy(the_id)

    redirect_to("/venues")
  end

end
