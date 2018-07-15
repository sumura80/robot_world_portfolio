class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except:[:index, :show]
  


  def search
    if params[:search].present?
      @listings = Listing.search(params[:search])
    else
      @listings = Listing.all
    end
  end


  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all

    #ロボット作品一覧コード
    
    @rand_num = rand(1..1000)
    @rand_price = rand(1..300)
    @set_number = rand(1..4)
    @bg = rand(1..2)

    #ロボットの種類を決める条件式
    if @set_number == 1
      @set = "set1"
    elsif 
      @set_number = 2
       @set = "set2"
    elsif 
      @set_number = 3
       @set = "set3"
    else
       @set = "set4"
    end


    #背景を決める条件式
      if @bg == 1
        @backgroud = "bg1"
      else
        @backgroud = "bg2"
      end

    @robots = Faker::Avatar.image(@rand_num, "300x300", "png", @set, @backgroud)

    @rand_num = rand(1..1000)
    @rand_price = rand(1..300)
    @set_number = rand(1..4)
    @bg = rand(1..2)

    #ロボットの種類を決める条件式
    if @set_number == 1
      @set = "set1"
    elsif 
      @set_number = 2
       @set = "set2"
    elsif 
      @set_number = 3
       @set = "set3"
    else
       @set = "set4"
    end


    #背景を決める条件式
      if @bg == 1
        @backgroud = "bg1"
      else
        @backgroud = "bg2"
      end
    @robots2 = Faker::Avatar.image(@rand_num, "300x300", "png", @set, @backgroud)

    @rand_num = rand(1..1000)
    @rand_price = rand(1..300)
    @set_number = rand(1..4)
    @bg = rand(1..2)

    #ロボットの種類を決める条件式
    if @set_number == 1
      @set = "set1"
    elsif 
      @set_number = 2
       @set = "set2"
    elsif 
      @set_number = 3
       @set = "set3"
    else
       @set = "set4"
    end


    #背景を決める条件式
      if @bg == 1
        @backgroud = "bg1"
      else
        @backgroud = "bg2"
      end
    @robots3 = Faker::Avatar.image(@rand_num, "300x300", "png", @set, @backgroud)

    @rand_num = rand(1..1000)
    @rand_price = rand(1..300)
    @set_number = rand(1..4)
    @bg = rand(1..2)

    #ロボットの種類を決める条件式
    if @set_number == 1
      @set = "set1"
    elsif 
      @set_number = 2
       @set = "set2"
    elsif 
      @set_number = 3
       @set = "set3"
    else
       @set = "set4"
    end


    #背景を決める条件式
      if @bg == 1
        @backgroud = "bg1"
      else
        @backgroud = "bg2"
      end
    @robots4 = Faker::Avatar.image(@rand_num, "300x300", "png", @set, @backgroud)
  end

  
  def show
    @review = Review.where(listing_id: @listing.id)
    if @review.blank?
      @avg_review = 0
    else
      @avg_review = @review.average(:rating).round(2)
    end
  end

  
  def new
    @listing = current_user.listings.build
  end

   
  def edit
  end
 
  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render 'new'
    end
    
    

    # respond_to do |format|
    #   if @listing.save
    #     format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
    #     format.json { render :show, status: :created, location: @listing }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @listing.errors, status: :unprocessable_entity }
    #   end
    # end
  end
 
  def update


    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

   

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :power, :product_no, :price, :image)
    end
end
