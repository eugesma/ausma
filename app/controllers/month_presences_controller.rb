class MonthPresencesController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /month_presences
  # GET /month_presences.json
  def index
    @filterrific = initialize_filterrific(
      MonthPresence,
      params[:filterrific],
      persistence_id: false,
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
        :search_by_name,
        :sorted_by
      ],
    ) or return
    @month_presences = @filterrific.find.page(params[:page]).per_page(15)
  end

  # GET /month_presences/1
  # GET /month_presences/1.json
  def show
  end

  # GET /month_presences/new
  def new
    @month_presence = MonthPresence.new
    @teachers = Teacher.all
  end

  # GET /month_presences/1/edit
  def edit
    @teachers = Teacher.all
    @post_types = PostType.all
  end

  # POST /month_presences
  # POST /month_presences.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        @teachers = Teacher.all
        @post_types = PostType.all
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /month_presences/1
  # PATCH/PUT /month_presences/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /month_presences/1
  # DELETE /month_presences/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to month_presences_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :post_type_id, teacher_ids: [], teacher_month_presences_attributes: [:id, :teacher_id])
    end
end
