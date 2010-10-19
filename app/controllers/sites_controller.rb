class SitesController < ApplicationController
  
  def index
    puts "CURRENT_SUBDOMAIN:: #{current_subdomain.inspect}"
    @site = Subdomain.find_by_name(current_subdomain.name)
  end
  
  def opps
    @site = Site.find_by_name(current_subdomain.name)
  end

end
