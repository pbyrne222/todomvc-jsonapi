class API::V1::TodosController < ApplicationController

  def index
    @todo = Todo.all
    render json: @todos, status: :ok
  end

  def create
   @todo = Todo.new(todo_params)
   if @todo.save
     render json: @todo, status: :created
   else
     render json: { errors: @todo.errors }, status: :bad_request
   end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      render json: @todo, status: :ok
    else
      render json: { errors: @todo.errors }, status: :bad_request
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end


  private

  def todos_param
   params.permit(:title, :order, :completed)
  end

end
