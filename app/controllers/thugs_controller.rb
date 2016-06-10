class ThugsController < ApplicationController
  before_action :gang
  before_action :thug, except: [:index, :new, :create]

  def index
    # Any index action should be paginated
    @thugs = @gang.thugs
  end

  def show
  end

  def new
    @thug = Thug.new
  end

  def create
    @thug = @gang.thugs.create(thug_params)
    if @thug.save
      redirect_to gang_thugs_path(@gang)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @thug.update(thug_params)
      redirect_to gang_thug_path(@gang, @thug)
    else
      render :edit
    end
  end

  def destroy
    @thug.destroy
    redirect_to gang_thugs_path(@gang)
  end

  private
    def thug_params
      params.require(:thug).permit(:name, :number_of_teardrops, :og, :alive)
    end

    def gang
      @gang = Gang.find(params[:gang_id])
    end

    def thug
      @thug = @gang.thugs.find(params[:id])
    end
end
