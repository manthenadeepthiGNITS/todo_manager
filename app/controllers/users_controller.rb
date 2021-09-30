class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
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
        name=params[:name]
        email=params[:email]
        password=params[:password]
        new_user=User.create!(name:name,email:email,password:password)
        response_text="creation done #{new_user.id}"
        render plain:response_text
      end
      def login
        email=params[:email]
        password=params[:password]
        valid_user=User.where("email = ? and password = ?", email,password)
        validity=valid_user.count>0 ? true : false
        render plain:validity
        
      end
      
      
end