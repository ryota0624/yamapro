class ImgsController < ApplicationController
	def upload
	require 'RMagick'
		params.each do |param|
			if param[1].class == ActionDispatch::Http::UploadedFile then
				img = EssayImg.new;
				img.name = param[0]
				image_magick = Magick::Image.from_blob(param[1].read).shift
				img.data = image_magick.resize_to_fit(300, 300).to_blob
				img.save
			end
		
		end
		render json: {ho: "hoge"}
	end
	
	def show
		img = EssayImg.find_by(name: params[:name])
		send_data(img.data, :disposition => "inline", :type => "image/jpeg")
	end
end