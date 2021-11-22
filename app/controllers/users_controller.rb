class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def new
    render "users/new"
  end


  def index
    render plain: User.order(:id).map{
    |user| user.to_pleasant_string
    }.join("\n")
  end
  def show
    id=params[:id]
    user=User.find(id)
    render plain:user.to_pleasant_string
  end
  def create
    first_name=params[:firstname]
    last_name=params[:lastname]
    email=params[:email]
    password=params[:password]
    new_user=User.create!(first_name:first_name,last_name:last_name,email:email,password:password)
    redirect_to "/"
  end
  def login
    email=params[:email]
    password=params[:password]
    valid_user=User.where("email = ? and password = ?", email,password)
    validity=valid_user.count>0 ? true : false
    render plain:validity

   end


end
