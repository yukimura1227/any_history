class ChronologiesController < ApplicationController
  before_action :set_chronology, only: [:show, :edit, :update, :destroy]
  before_action :set_chronologies, only: %i[index cards]

  # GET /chronologies
  # GET /chronologies.json
  def index
  end

  # GET /chronologies/1
  # GET /chronologies/1.json
  def show
  end

  def cards
  end

  def view
    @chronology =
      Chronology
      .includes(categories: :taggings)
      .find_by(token: params[:token])
  end

  # GET /chronologies/new
  def new
    @chronology = Chronology.new
  end

  # GET /chronologies/1/edit
  def edit
  end

  # POST /chronologies
  # POST /chronologies.json
  def create
    @chronology = Chronology.new(chronology_params)
    @chronology.user = current_user

    respond_to do |format|
      if @chronology.save
        format.html { redirect_to @chronology, notice: 'Chronology was successfully created.' }
        format.json { render :show, status: :created, location: @chronology }
      else
        format.html { render :new }
        format.json { render json: @chronology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chronologies/1
  # PATCH/PUT /chronologies/1.json
  def update
    respond_to do |format|
      if @chronology.update(chronology_params)
        format.html { redirect_to @chronology, notice: 'Chronology was successfully updated.' }
        format.json { render :show, status: :ok, location: @chronology }
      else
        format.html { render :edit }
        format.json { render json: @chronology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chronologies/1
  # DELETE /chronologies/1.json
  def destroy
    @chronology.destroy
    respond_to do |format|
      format.html { redirect_to chronologies_url, notice: 'Chronology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_chronology
    @chronology =
      if current_user.admin?
        Chronology.find_by(id: params[:id])
      else
        Chronology.find_by(id: params[:id], user_id: current_user.id)
      end
  end

  def set_chronologies
    @chronologies =
      if current_user.admin?
        Chronology.includes(:user).all
      else
        Chronology.includes(:user).where(user: current_user)
      end
  end

  def chronology_params
    params.require(:chronology).permit(:title, :description, :token)
  end
end
