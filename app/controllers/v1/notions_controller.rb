class V1::NotionsController < ApplicationController
  before_action :set_notion, only: [:show, :update, :destroy]

  # GET /notions
  def index
    @notions = Notion.all

    render json: @notions
  end

  # GET /notions/1
  def show
    render json: @notion
  end

  # POST /notions
  def create
    @notion = Notion.new(notion_params)

    if @notion.save
      render json: @notion, status: :created
    else
      render json: @notion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notions/1
  def update
    puts "~~~~~~~~~~~~~~õ", notion_params
    if @notion.update(notion_params)
      render json: @notion
    else
      render json: @notion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notions/1
  def destroy
    @notion.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notion
    @notion = Notion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def notion_params
    params.require(:notion).permit(:name, data: {})
  end
end
