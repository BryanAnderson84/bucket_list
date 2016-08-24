class BucketlistsController < ApplicationController

  before_action :bucketlist, except:[:index, :new, :create]

  def index
    @bucketlists = Bucketlist.all
  end
  
  def new
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = Bucketlist.new(bucketlist_params)
    if @bucketlist.save
      redirect_to bucketlist_path(@bucketlist)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @bucketlist.update(bucketlist_params)
    redirect_to bucketlist_path(@bucketlist)
  end

  def destroy
    @bucketlist.destroy
    redirect_to bucketlists_path
  end

  private

  def bucketlist_params
    params.require(:bucketlist).permit(:name)
  end

  def bucketlist
    @bucketlist = Bucketlist.find(params[:id])
  end
end
