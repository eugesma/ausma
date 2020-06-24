class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :validate]

  # GET /posts
  # GET /posts.json
  def index
    authorize Post
    @filterrific = initialize_filterrific(
      Post,
      params[:filterrific],
      persistence_id: false,
      default_filter_params: { sorted_by: 'name_at_asc' },
      available_filters: [
        :search_by_name,
        :sorted_by
      ],
    ) or return
    @posts = @filterrific.find.page(params[:page]).per_page(15)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    authorize @post
  end

  # GET /posts/new
  def new
    authorize Post
    @post = Post.new
    @teachers = Teacher.all
    @post_types = PostType.all
  end

  # GET /posts/1/edit
  def edit
    authorize @post
    @teachers = Teacher.all
    @post_types = PostType.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.created_by = current_user
    authorize @post

    respond_to do |format|
      if @post.save!
        format.html { redirect_to @post, notice: 'La publicación se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @post }
      else
        @teachers = Teacher.all
        @post_types = PostType.all
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'La publicación se ha modificado correctamente.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def validate
    authorize @post
    @post.validado!
    flash.now[:notice] = "La publicación se ha validado correctamente"
    respond_to do |format|
      format.html { redirect_to @post, notice: 'La publicación se ha validado correctamente' }
      format.js
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'La publicación se ha eliminado correctamente.' }
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
      params.require(:post).permit(:name, :post_type_id, :link, :published_at, teacher_ids: [], teacher_posts_attributes: [:id, :teacher_id])
    end
end
