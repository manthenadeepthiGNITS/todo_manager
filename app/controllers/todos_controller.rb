class TodosController < ApplicationController
    def index
      #current_user
      @todos = Todo.of_user(current_user)
      render "index"
    end
    def show
      id=params[:id]
      todo=Todo.of_user(current_user).find(id)
      render "todo"
    end
    def create
      todo_text=params[:todo_text]
      due_date=params[:due_date]
      new_todo=Todo.new(todo_text:todo_text,due_date:due_date,completed:false, user_id: current_user.id,)
      if new_todo.save
        redirect_to todos_path
      else
        flash[:error]=new_todo.errors.full_messages.join(", ")
        redirect_to todos_path
      end
    end
    def update
      completed=params[:completed]
      id=params[:id]
      todo=Todo.of_user(current_user).find(id)
      todo.completed=completed
      todo.save!
      redirect_to todos_path
      #render plain:"updated #{id}"
    end
    def destroy
      id= params[:id]
      todo = Todo.of_user(current_user).find(id)
      todo.destroy
      redirect_to todos_path
    end
end
