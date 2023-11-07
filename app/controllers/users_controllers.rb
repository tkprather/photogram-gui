class UsersController < ApplicationController
  def homepage
  redirect_to("/users")
  end
  
  def index
  matching_users = User.all
  @list_of_users = matching_users.order({ :username => :asc })
  
  render ({ :template => "user_templates/index" })
  end
  
  def show
  url_username = params.fetch("path_username")
  
  matching_usernames = User.where({ :username => url_username })
  
  @the_user = matching_usernames.at(0)
  
  render ({ :template => "user_templates/show" })
  
  end
  
  def create
minput_username = params.fetch("query_username")
ma_new_user = User.new
ma_new_user.username = input_username
  
ma_new_user.save
  
mredirect_to("/users/" + a_new_user.username)
  end
  
  def update
muser_id = params.fetch("modify_user")
  
  matching_users = User.where({ :id => user_id })
  
  the_user = matching_users.at(0)
  
  input_username = params.fetch("query_username")
  
  the_user.username = input_username
  
  the_user.save
  
  redirect_to("/users/" + the_user.username)
  
  end
  end
