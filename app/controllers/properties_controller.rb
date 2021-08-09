class PropertiesController < ApplicationController
    def new
        @property= Property.new
    end 

    def create
        
        @property = Property.new(params.require(:property).permit(:property_name,:property_desc,:property_price,:property_address,images:[]))
        @property.company_id= current_agent.company_id

        if @property.save 
            redirect_to properties_path
        else
            render 'new'
        end 
    end

    def show
        @property = Property.find(params[:id])

    end

    def index
        @property= Property.all
    end 

    def destroy
        @property = Property.find(params[:id])
        @property.destroy
    end

    def add_smartlock
        @smartlock = Smartlock.find(params[:id])
       if @smartlock.update(:property_id=>params[:property_id])
        redirect_to  properties_path
       else 
        render 'index'
       end 
        
    end 

end
