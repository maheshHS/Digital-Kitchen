class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all.order("created_at DESC")
  end

  def new
    @purchase = Purchase.new
    @purchase.items.build
  end

  def create
    @purchase = Purchase.new(purchase_params)
    item_list = params[:purchase][:items_attributes].values
    item_list.each do |item|
      unless item.empty?
        if item[:_destroy] == "false"
          @item = Item.find(item[:id])
          @purchase.items << @item
        end
      end
    end
    #Remove Duplicate Items If any
    @purchase.items = @purchase.items.uniq()
    #debugger
    @purchase.user_id = current_user.id
    if @purchase.save
      #Adding the Quantity to MergeTable Model
      quant = Hash.new
      @purchase.items.each do |item|
        val = Purchaseitem.where(purchase: @purchase, item: item).first
        selval = item_list.detect { |i| i["id"].to_i == item.id }
        quant.store(val.id, { "quantity" => selval["purchaseitem_ids"].to_i, "cost" => selval["merge_table_ids"].to_f })
      end
      #Updating Quantity to Item
      i_quant = Hash.new
      item_list.each do |itm|
        i_q = Item.find(itm["id"].to_i).t_qunatity.to_i + itm["purchaseitem_ids"].to_i
        i_quant.store(itm["id"].to_i, { "t_qunatity" => i_q })
      end

      #End
      if Purchaseitem.update(quant.keys, quant.values) and Item.update(i_quant.keys, i_quant.values)
        flash[:notice] = "Product Saved"
        redirect_to purchases_path
      else
        flash[:error] = "Product Save Unsuccessfull"
        render :new
      end
    else
      flash[:error] = "Product Save Unsuccessfull"
      render :new
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
    @purchase.items.build
  end

  private

  def purchase_params
    params.require(:purchase).permit(:seller, :cost)
  end
end
