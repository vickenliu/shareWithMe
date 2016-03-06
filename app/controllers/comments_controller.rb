class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # POST /comments
  # POST /comments.json
  def create
    @item= Item.find(params[:item_id])
    @comment = @item.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @item, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@item,@comment] }
      else
        format.html { redirect_to @item, notice: 'you cant leave comment body empty' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @item= Item.find(params[:item_id])
    @comment=@item.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @item, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:nickname, :body, :item_id)
    end
end
