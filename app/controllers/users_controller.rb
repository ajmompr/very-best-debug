class UsersController < ApplicationController

  def index
    @user_list = User.all.order( :created_at => :desc)
    render({ :template => "users_templates/all_users"})
  end

  def home
    @user_list = User.all.order( :created_at => :desc)
    render({ :template => "users_templates/all_users"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)
    
    the_user.username = params.fetch("query_username")
    the_user.save
    redirect_to("/users/#{user.username}")
  end

end
