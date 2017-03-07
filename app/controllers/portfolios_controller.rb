class PortfoliosController < ApplicationController
  
  def index
    @portfolio_items = Portfolio.all
  end
  
  def new
    @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.new(portfolio_item_params)
    
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully destroyed.' }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_item_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end  

end
