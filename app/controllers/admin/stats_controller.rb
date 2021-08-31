class Admin::StatsController < ApplicationController
  #NOTICE THAT THE ADMIN CONTROLLERS NEED TO SPECIFY THE ADMIN
#this controller is used to know how many posts and authors we have 
#add this to the routes - only ADMINS should be able to see stats 
#the route should be = 'get '/admin/stats' to: 'stats#index'
  def index
    @post_count = Post.count
    @authors_count = Author.count
    @last_post = Post.last
  end
end

