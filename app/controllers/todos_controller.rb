class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
    def index
      #render plain: Todo.order(:due_date).map{
      #  |todo| todo.to_pleasant_string
      #  }.join("\n")
      render "index"
    end
    def show
      id=params[:id]
      todo=Todo.find(id)
      render "todo"
      #render plain:todo.to_pleasant_string
    end
    def create
      todo_text=params[:todo_text]
      due_date=DateTime.parse(params[:due_date])
      new_todo=Todo.create!(todo_text:todo_text,due_date:due_date,completed:false)
      response_text="creation done #{new_todo.id}"
      #render plain:response_text
      redirect_to todos_path
    end
    def update
      completed=params[:completed]
      id=params[:id]
      todo=Todo.find(id)
      todo.completed=completed
      todo.save!
      redirect_to todos_path
      #render plain:"updated #{id}"
    end
end
