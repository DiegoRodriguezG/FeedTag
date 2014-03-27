require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  test "should get session" do
    get :session
    assert_response :success
  end

end
