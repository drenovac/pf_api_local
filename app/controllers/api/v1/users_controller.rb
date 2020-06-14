class API::V1::UsersController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!

  def info
    @user = current_user
  end
end
