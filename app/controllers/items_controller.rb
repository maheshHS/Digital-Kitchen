class ItemsController < ApplicationController

    def index
        #@inventories = Inventory.all
        @items = Item.all
        @item = Item.new
    end

    def new
        @item = Item.new
        logger.debug 
    end

    def create
        @item = Item.new(item_params)
        @item.user_id = current_user.id
        if @item.save   
            flash[:success] = 'Item Saved'   
            redirect_to items_path 
          else   
            flash[:error] = 'Item Save Unsuccessfull'   
            render :new   
          end   
    end

    

    def destroy   
        @item = Item.find(params[:id])
        @item.inventories.clear    
        if @item.delete   
          flash[:success] = 'Item deleted!'   
          redirect_to items_path   
        else   
          flash[:error] = 'Failed to delete this Item!'   
          render :index   
        end   
    end  
    
    def update   
      @item = Item.find(params[:id]) 
      @item.user_id = current_user.id
      if @item.update(item_params) 
        flash[:success] = 'Item updated!'   
        redirect_to items_path  
      else   
        flash[:error] = 'Failed to edit Item!'   
        render :edit   
      end   
    end   

    private

    def item_params
        params.require(:item).permit(:title, :cost)
    end

end