class ItemsController < ApplicationController

  before_action :item, except: [:index, :new, :create]
  before_action :bucketlist

  def index
    @items = @bucketlist.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = @bucketlist.items.new(item_params)
    if @item.save
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
    if @item.update(item_params)
    redirect_to bucketlist_item_path(@bucketlist)
    else
    render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to bucketlist_path(@bucketlist)
  end

  private

  def item_params
    params.require(:item).permit(:description, :category, :location, :completed)
  end

  def item
    @item = Item.find(params[:id])
  end

  def bucketlist
    @bucketlist = Bucketlist.find(params[:bucketlist_id])
  end

end
