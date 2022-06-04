class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]

  # GET /items or /items.json
  def index
    @items = current_user.items.includes(:group).order('created_at DESC')
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = current_user.items.build
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  def uncategorized
    @uncategorized = current_user.items.where(group_id: nil).all.order('created_at DESC')
    @amount_sum = current_user.items.sum(:amount)
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    redirect_to items_path, notice: 'Not Authorized to edit this group' if @item.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :amount, :user_id, :group_id)
  end
end
