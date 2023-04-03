class UsersController < ApplicationController
 
  require 'bcrypt'
   require 'jwt'
   before_action :session_expired?, only: [:check_login_status] 


 
   def index
    @users = User.all
    render json: @users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end
  def login
    user_params = params.require(:user).permit(:username, :email, :password)
  
    sql = "username = :username OR email = :email"
    user = User.where(sql, { username: user_params[:username], email: user_params[:email] }).first
  
    if user&.authenticate(user_params[:password])
      save_user(user.id)
      token = encode(user.id, user.email)
      app_response(message: 'Login was successful', status: :ok, data: { user: user, token: token })
    else
      app_response(message: 'Invalid username/email or password', status: :unauthorized)
    end
  end

  def authenticate(password)
    if !password.blank? && super(password)
      return self
    else
      return false
    end
  end


  
  def save_user(user_id)
    session[:user_id] = user_id
  end
  
  def encode(user_id, user_email)
    # Implement token encoding logic here
    # For example, using JWT: JWT.encode({ user_id: user_id, user_email: user_email }, 'secret')
  end
  
  def app_response(message:, status:, data: {})
    render json: { message: message, status: status, data: data }
  end
  
  
   def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
  
  
  
  

  
  def logout
    remove_user
    app_response(message: 'Logout successful')
  end

  def check_login_status
    if current_user
      app_response(message: 'User is logged in', status: :ok)
    else
      app_response(message: 'User is not logged in', status: :unauthorized)
    end
  end
  
 

    

end
