class UsuarioController < ApplicationController

  def crear_session
  	usuario = Usuario.form_omniauth(env["omniauth.auth"])
    session[:id] = usuario.id
    redirect_to root_url
  end

  def eliminar_session
  	session[:id] = nil
    redirect_to root_url
  end
end
