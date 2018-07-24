class TasksController < ApplicationController
before_action :set_task, only: [:show, :edit, :destroy]
	def index
		@tasks = Task.all
	end

	def show
		@task = Task.find(params[:id])
	end

	def new
		@task = Task.new
	end
	
	def create
		@task = Task.new(task_params)
		#Sauvegarder les taches 
		@task.save
		#Rediriger vers la page Show
		redirect_to task_path(@task)
	end

	def edit
	end

	def destroy
	@task.destroy
	    # redirect to index
	redirect_to tasks_path
	end	


	def task_params
    params.require(:task).permit(:title, :details)
    end

    def set_task
    @task = Task.find(params[:id])
end
end

