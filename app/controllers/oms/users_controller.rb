#
module Oms
  class UsersController < Oms::ResourcesController

    def update
      if @resource.valid?
        OmsService::User::Updater.new(@resource, permitted_params).exec
        flash[:notice] = I18n.t('flash.actions.update.notice', resource_name: @resource.model_name.human)
        respond_to do |format|
          format.html { redirect_to oms_users_path }
          format.js { js_redirect_to oms_users_path }
        end
      else
        flash[:alert] = I18n.t('flash.actions.update.alert', resource_name: @resource.model_name.human)
        render :edit
      end
    end

    protected

    def klass
      ::User
    end

    def permitted_params
      params.require(:resource).permit(:payout_rate, role_ids: [], products: [])
    end
  end
end
