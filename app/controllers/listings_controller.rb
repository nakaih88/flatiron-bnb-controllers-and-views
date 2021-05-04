class ListingsController < ApplicationController
    def index
      if params[:start_date] && params[:end_date]
        start_date = stringify_date(params[:start_date])
        end_date = stringify_date(params[:end_date])
        # byebug
        return @listings = Listing.available(start_date, end_date)
      else
        return @listings = Listing.all
      end
    end
  
    def show
      @listing = Listing.find(params[:id])
    end
  
    def new
      @listing = Listing.new
    end
  
    def create
      @listing.create(listing_params)
      redirect_to listing_path
    end
  
    def edit
      @listing = Listing.find(params[:id])
    end
  
    def update
      @listing.update(listing_params)
      redirect_to listing_path
    end
  
    def destroy
      @listing = Listing.find(params[:id])
      @listing.destroy
      redirect_to listings_path
    end
  
    private
  
      def stringify_date(date_param_hash)
        DateTime.new(
          date_param_hash[:year].to_i,
          date_param_hash[:month].to_i,
          date_param_hash[:day].to_i
        )
      end
  end