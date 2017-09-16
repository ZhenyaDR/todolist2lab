class TodoController < ApplicationController
 before_action :set_tod, only: [:edit, :update, :destroy]
  def index
  	@todo=Todo.new
  end
  def show
  	@proj=Project.all
  end
  def edit 
 	
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todoshow_path }
      else
        format.html { render :show }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todoshow_path }
      else
        format.html { render :edit  }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
        format.html { redirect_to todoshow_path }
    end
  end
private
   def todo_params
      return params.require(:todo).permit(:text,:isCompleted,:project_id)
   end

  def set_tod
    @todo = Todo.find(params[:id].to_i) rescue nil?
    if @todo==false
      redirect_to  errors_path
    end
end

end