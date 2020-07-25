class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
    @item = Item.new
  end

  def new
    @inventory = Inventory.new
    @inventory.items.build
  end

  def create
    #render plain: params[:inventory].inspect
    @inventory = Inventory.new(inventory_params)
    @inventory.user_id = current_user.id
    item_list = params[:inventory][:items_attributes].values
    item_list.each do |item|
      unless item.empty?
        if item[:_destroy] == "false"
          @item = Item.find(item[:id])
          @inventory.items << @item
        end
      end
    end

    #Remove Duplicate Items If any
    @inventory.items = @inventory.items.uniq()
    @inventory.user_id = current_user.id
    if @inventory.save
      #debugger
      #Adding the Quantity to MergeTable Model
      quant = Hash.new
      @inventory.items.each do |item|
        val = MergeTable.where(inventory: @inventory, item: item).first
        selval = item_list.detect { |i| i["id"].to_i == item.id }
        quant.store(val.id, { "quantity" => selval["merge_table_ids"].to_i })
      end
      if MergeTable.update(quant.keys, quant.values)
        flash[:notice] = "Product Saved"
        redirect_to inventories_path
      else
        flash[:error] = "Product Save Unsuccessfull"
        render :new
      end
    else
      flash[:error] = "Product Save Unsuccessfull"
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.items.clear
    if @inventory.delete
      flash[:notice] = "Item deleted!"
      redirect_to inventories_path
    else
      flash[:error] = "Failed to delete this Item!"
      render :index
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])
    #@mergeList = @inventory.merge_tables
  end

  def update
    @inventory = Inventory.find(params[:id])
    #@mergeList = @inventory.merge_tables
    @inventory.items.clear
    item_list = params[:inventory][:items_attributes].values
    item_list.each do |item|
      unless item.empty?
        if item[:_destroy] == "false"
          @item = Item.find(item[:id])
          @inventory.items << @item
        end
      end
    end
    @inventory.items = @inventory.items.uniq()

    #Adding the Quantity to MergeTable Model
    quant = Hash.new
    @inventory.items.each do |item|
      val = MergeTable.where(inventory: @inventory, item: item).first
      selval = item_list.detect { |i| i["id"].to_i == item.id }
      quant.store(val.id, { "quantity" => selval["merge_table_ids"].to_i })
    end
    @inventory.user_id = current_user.id
    if @inventory.update(inventory_params) and MergeTable.update(quant.keys, quant.values)
      flash[:notice] = "Item updated!"
      redirect_to inventories_path
    else
      flash[:error] = "Failed to edit Item!"
      render :edit
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
