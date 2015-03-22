class GonzoController < ApplicationController
	def index
		@gonzos = Gonzo.all
	end

	def show
		@gonzo = Gonzo.find(params[:id])
	end

	def new
		@gonzo = Gonzo.new
	end

	def gonzos_params
		params.require(:gonzo).permit(:title, :body)
	end

	def create
		@gonzo = Gonzo.new(gonzos_params)
			
		if @gonzo.save
			redirect_to gonzos_path, :notice => "Your new Gonzo was created!"
		else
			render "new"
		end
	end

	def edit
		@gonzo = Gonzo.find(params[:id])
	end

	def update
		@gonzo = Gonzo.find(params[:id])

		if @gonzo.update_attributes(gonzos_params)
			redirect_to gonzos_path, :notice => "Your Gonzo was updated!"
		else
			render "edit"
		end
	end

	def destroy
		@gonzo = Gonzo.find(params[:id])
		@gonzo.destroy

		redirect_to gonzos_path, :notice => "Your Gonzo was deleted!"
	end
end
