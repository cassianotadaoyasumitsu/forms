class FormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def index
      @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @form = Form.find(params[:id])
  end

  def update
    @form = Form.find(params[:id])
    if @form.update(form_params)
      if @user.admin
        redirect_to form_path(params[:id])
      else
        redirect_to root_path
      end
    else
      render :edit
    end
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy!
    redirect_to forms_path
  end

  private

  def form_params
    params.require(:form).permit(
        :name,
        :phone,
        :prefecture,
        :address,
        :driver,
        :licences,
        :passport,
        :my_number,
        :observations
      )
  end
end
