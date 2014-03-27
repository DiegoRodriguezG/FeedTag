class Usuario < ActiveRecord::Base
	
	def self.form_omniauth(auth)
		usuario = where(auth.slice("providers", "uid")).first || create_user_omniauth(auth)
    usuario.oauth_token = auth["credentials"]["token"]
    usuario.oauth_secret = auth["credentials"]["secret"]
    usuario.save!
    usuario
	end

	def self.create_user_omniauth(auth)
    create! do |usuario|
    	usuario.providers = auth["providers"]
      usuario.uid = auth["uid"]
      usuario.nombre = auth["info"]["nickname"]
    end
  end
  
  def twitter
    if provider == "twitter"
      @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
    end
  end
end