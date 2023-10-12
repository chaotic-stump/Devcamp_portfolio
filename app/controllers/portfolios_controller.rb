class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[ edit show update destroy ]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.order(:position)
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    3.times { @portfolio_item.technologies.build }
  end

  def update
    
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "The record was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  
  def show
  end

  def destroy

    # destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Blog was successfully destroyed." }
    end
  end

  def update_position
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.insert_at(portfolio_params[:position].to_i)
    head :ok
  end

  private
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        :position,
                                        :thumb_image,
                                        :main_image,
                                        technologies_attributes: [:name],
                                      )
    end
end
