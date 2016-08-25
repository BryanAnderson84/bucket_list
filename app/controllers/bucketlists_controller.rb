class BucketlistsController < ApplicationController
  before_action :bucketlist, except:[:index, :new, :create]

  def index
    @bucketlists = Bucketlist.where(user_id:current_user.id)
  end

  def new
    @bucketlist = Bucketlist.new
  end

  def create
    @bucketlist = Bucketlist.new(bucketlist_params)
    @bucketlist.user_id = current_user.id
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
    params.require(:bucketlist).permit(:name, :user_id)
  end

  def bucketlist
    @bucketlist = Bucketlist.find(params[:id])
  end
end
