class GangsController < ApplicationController
  before_action :gang, except: [:index, :new, :create]

  def index
  end

  def show
  end

  def new
    @gang = Gang.new
  end

  def create
    @gang = Gang.new(gang_params)
    if @gang.save
      flash[:success] = 'Gang created.'
      redirect_to gangs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gang.update(gang_params)
      flash[:success] = 'Gang updated.'
      redirect_to gang_path(@gang)
    else
      render :edit
    end
  end

  def destroy
    @gang.destroy
    flash[:success] = 'Gang destroyed'
    redirect_to gangs_path
  end

  private
    def gang_params
      params.require(:gang).permit(:name)
    end

    def gang
      @gang = Gang.find(params[:id])
    end
end
