class ConversionsController < ApplicationController
    def index
        @conversions = Conversion.all
        #@add_conversions = [Conversion.new]
        @conversion = Conversion.new
        @items = Item.all
    end

    def create
        @conversion = Conversion.new(conversions_params)
        if @conversion.save
            flash[:notice] = 'Conversion Saved'   
            redirect_to conversions_path
        else
            flash[:error] = 'Conversion Save failed'   
            redirect_to conversions_path 
        end
    end

    def destroy   
        @conversion = Conversion.find(params[:id])
        if @conversion.delete   
          flash[:notice] = 'Conversion deleted!'   
          redirect_to conversions_path   
        else   
          flash[:error] = 'Delete Operation Failed'   
          render :index   
        end   
    end

    def update
        @conversion = Conversion.find(params[:id]) 
        if @conversion.update(conversions_params) 
          flash[:notice] = 'Conversion updated!'   
          redirect_to conversions_path  
        else   
          flash[:error] = 'Update Operation Failed'   
          redirect_to conversions_path 
        end   
    end
    
    private

    def conversions_params
        params.require(:conversion).permit(:name, :quantity, :converted_quant)
    end
end