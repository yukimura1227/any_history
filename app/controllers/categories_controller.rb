class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :set_some_category, only: %i[add_tag remove_tag]

  # GET /categories
  # GET /categories.json
  def index
    @categories =
      if current_user.admin?
        Category.all
      else
        Category.joins(:chronology).where(chronologies: { user_id: current_user.id })
      end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        @category_and_timeline_html = render_to_string partial: 'chronologies/category_and_timeline', locals: { category: @category, chronology: @category.chronology }
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
        format.js
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_tag
    @category.tag_list << params[:tag][:tag]
    @tag = Tag.find_by(name: params[:tag][:tag])
    @category.save
    @tag_form_html = render_to_string partial: 'chronologies/tag_form', locals: { category: @category, tag: @tag }
    respond_to do |format|
      format.js
    end
  end

  def remove_tag
    @category.tag_list.remove(params[:tag][:tag])
    @tag = Tag.find_by(name: params[:tag][:tag])
    @category.save
    @tag_form_html = render_to_string partial: 'chronologies/tag_form', locals: { category: @category, tag: @tag }
    respond_to do |format|
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category =
      if current_user.admin?
        Category.find(params[:id])
      else
        Category.joins(:chronology).find_by(id: params[:id], chronologies: { user_id: current_user.id })
      end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_some_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:theme, :chronology_id)
  end
end
