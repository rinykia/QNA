class Api::V1::ProfilesController < Api::V1::BaseController
  #doorkeeper_for :all удален
  #before_action :doorkeeper_authorize! перенесли в base_controller
  #respond_to :json перенесли в base_controller
  def me
    respond_with current_resource_owner
  end

  #protected

  #def current_resource_owner перенесли в base_controller
  #  @current_resource_owner ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  # end
end