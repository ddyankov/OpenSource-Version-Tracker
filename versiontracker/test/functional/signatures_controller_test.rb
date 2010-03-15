require 'test_helper'

class SignaturesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signature" do
    assert_difference('Signature.count') do
      post :create, :signature => { }
    end

    assert_redirected_to signature_path(assigns(:signature))
  end

  test "should show signature" do
    get :show, :id => signatures(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => signatures(:one).to_param
    assert_response :success
  end

  test "should update signature" do
    put :update, :id => signatures(:one).to_param, :signature => { }
    assert_redirected_to signature_path(assigns(:signature))
  end

  test "should destroy signature" do
    assert_difference('Signature.count', -1) do
      delete :destroy, :id => signatures(:one).to_param
    end

    assert_redirected_to signatures_path
  end
end
