class V1::AspectsController < ApplicationController
  before_action :set_aspect, only: [:show, :update, :destroy]

  # GET /aspects
  def index
    @aspects = Aspect.all

    render json: @aspects
  end

  # GET /aspects/1
  def show
    render json: @aspect.as_json.merge({ "children" => @aspect.children.map(&:as_json) })
  end

  # POST /aspects
  def create
    @aspect = Aspect.new(aspect_params)

    if @aspect.save
      render json: @aspect, status: :created
    else
      render json: @aspect.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /aspects/1
  def update
    if @aspect.update(aspect_params)
      render json: @aspect
    else
      render json: @aspect.errors, status: :unprocessable_entity
    end
  end

  # DELETE /aspects/1
  def destroy
    @aspect.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aspect
      @aspect = Aspect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aspect_params
      params.require(:aspect).permit(:name, :parent_id, data: {})
    end
end
