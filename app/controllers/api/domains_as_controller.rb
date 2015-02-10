class Api::DomainsAsController < ApiDomainController
	include Loginable
	before_action do
		@user = current_user
		@id = params[:id] unless params[:id].blank?
	end

	def index
		@as = getDomain.as
	end

	def show
		@a = getDomain.as.find @id
	end

	def create
		begin
			getDomain.as.create! params.require(:domains_a).permit(:name, :to_ip)
			@success = true
		rescue
			@success = false
		end
	end

	def destroy
		@a = getDomain.as.find @id
		begin
			@a.destroy!
			@success = true
		rescue
			@success = false
		end
	end
end