class AuthenticationController < ApplicationController
 skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateUser.call(params[:name], params[:password])

   if command.success?
     @user = User.find_by_name(params[:name])
     render json: { auth_token: command.result, id: @user.id, name: params[:name] }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end

 def new_user
   @user = User.new(name: params[:name], password: params[:password])
   if @user.save
     command = AuthenticateUser.call(params[:name], params[:password])
     render json: {name: params[:name], id: @user.id, auth_token: command.result}, status: :created
   else
     render json: @user.errors, status: :unprocessable_entity
   end
 end

end
