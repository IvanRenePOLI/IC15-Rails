module Api
  class CommentsController < ApplicationController
    include RenderHelper
    before_action :set_comment, only: [:show, :update], raise: false
    skip_before_action :authenticate_user!, only: [:create], raise: false
    respond_to :json

    def index
      @comments = Comment.all
      render_default_format(@comments, true, 200)
    end

    def show
      render_default_format(@comment,true,200)
    rescue Exception => e
      puts e.inspect
    end

    def create
      @comment = Comment.create(:body => params[:body], :rating => params[:rating], :name => params[:name] )
      puts params
        if @comment.save
          render_success_format('Su comentario ha sido registrado correctamente', @comment, true)
        end
    rescue Exception => e
      render_default_error e, 401
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @product = Comment.find_by(id: params[:id])
    rescue Exception => e
      render_default_error e, 401
    end

    # Never trust parameters from the scary internet, only allow the white list through.


  end
end
