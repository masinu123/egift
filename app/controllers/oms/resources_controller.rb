# Oms::ResourcesController
module Oms
  class ResourcesController < Oms::ApplicationController
    helper_method :klass,
                  :klass_name,
                  :klass_plural_name,
                  :klass_constantize,
                  :new_resource_path,
                  :collection_path,
                  :edit_resource_path,
                  :resource_path,
                  :filter_query_blank?

    before_action :authenticate_user!
    before_action :set_resource, only: [:show, :edit, :update, :destroy]
    before_action :set_default_filters, only: :index

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root, alert: exception.message
    end

    def current_ability
      @current_ability ||= Ability.new(current_user)
    end

    def index
      respond_to do |format|
        format.html do 
          @collection = klass.all.order(id: :desc)
          render :index
        end
      end
    end

    def show
      respond_to do |format|
        format.html { render :show }
        format.js { render :show }
      end
    end

    def new
      respond_to do |format|
        format.html { render :new }
        format.js { render :new }
      end
    end

    def create
      @resource = (form_klass || klass).new(permitted_params)
      if @resource.valid?
        @resource = create_resource()
        flash[:notice] = I18n.t('flash.actions.create.notice', resource_name: @resource.model_name.human)
        respond_to do |format|
          format.html { redirect_to resource_path }
          format.js { 
            params[:reload] == 'true' ? js_reload : js_redirect_to(resource_path, formats: :js )
          }
          format.json { render json: serializer.new(@resource, root: :data), status: :created }
        end
      else
        flash[:alert] = I18n.t('flash.actions.create.alert', resource_name: @resource.model_name.human)
        respond_to do |format|
          format.html { render :new }
          format.js { render :new }
          format.json { render json: Oj.dump({ message: @resource.errors.full_messages.join(', '), error_code: 'InvalidParam', errors: @resource.errors }, mode: :compat), status: 400 }
        end
      end
    end

    def edit
      respond_to do |format|
        format.html { render :edit }
        format.js { render :edit }
      end
    end

    def update
      @resource.assign_attributes(permitted_params)
      if @resource.valid?
        update_resource()
        flash[:notice] = I18n.t('flash.actions.update.notice', resource_name: @resource.model_name.human)
        respond_to do |format|
          format.html { redirect_to resource_path }
          format.js { params[:reload] == 'true' ? js_reload : js_redirect_to(resource_path) }
        end
      else
        flash[:alert] = I18n.t('flash.actions.update.alert', resource_name: @resource.model_name.human)
        render :edit
      end
    end

    def destroy
      destroyer_klass.new(klass.find(params[:id])).exec
      flash[:notice] = I18n.t('flash.actions.destroy.notice', resource_name: @resource.model_name.human)
      respond_to do |format|
        format.html { redirect_to collection_path }
        format.js { js_redirect_to collection_path }
      end
    end

    protected

    def create_resource
      creator_klass.new(permitted_params).exec
    end

    def update_resource
      updater_klass.new(klass.find(params[:id]), permitted_params).exec
    end

    def klass
      raise NotImplementedError
    end

    def permitted_params
      raise NotImplementedError
    end

    def set_default_filters
      params[:q] ||= {}
    end

    def index_collection
      nil
    end

    def form_klass
      "OmsForm::#{klass_constantize}".constantize
    end

    def creator_klass
      "OmsService::#{klass_constantize}::Creator".constantize
    end

    def updater_klass
      "OmsService::#{klass_constantize}::Updater".constantize
    end

    def destroyer_klass
      "OmsService::#{klass_constantize}::Destroyer".constantize
    end

    def collection_path(options = {})
      send("oms_#{klass_plural_name}_path", options)
    end

    def resource_path(resource = nil, options = {})
      send("oms_#{klass_name}_path", resource || @resource, options)
    end

    def new_resource_path(options = {})
      send("new_oms_#{klass_name}_path", options)
    end

    def edit_resource_path(resource, options = {})
      send("edit_oms_#{klass_name}_path", resource, options)
    end

    def klass_name
      @klass_name ||= klass.name.underscore
    end

    def klass_plural_name
      @klass_plural_name ||= klass.name.pluralize.underscore
    end

    def serializer
      OmsSerializer::Resource
    end

    def set_resource
      @resource = (form_klass || klass).find(params[:id])
    end

    def klass_constantize
      @klass_constantize ||= klass.name.constantize
    end

    def set_authorization
      case action_name
      when 'edit', 'update'
        authorize!(:update, @resource || klass_constantize)
      when 'new', 'create'
        authorize!(:create, @resource || klass_constantize)
      when 'destroy'
        authorize!(:destroy, @resource || klass_constantize)
      else
        authorize!(:read, @resource || klass_constantize)
      end
    end
  end
end
