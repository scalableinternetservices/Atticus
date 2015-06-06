require 'test_helper'

class ContractsControllerTest < ActionController::TestCase
  setup do
    @contract = contracts(:one)
    user = User.first
    sign_in User.first
  end

   test "should get index" do
    get :index
     assert_response :success
     assert_not_nil assigns(:contracts)
   end

   test "should get new" do
     get :new
     assert_response :success
   end


   test "should show contract" do
     get :show, id: @contract
     assert_response :success
   end

   test "should get edit" do
     get :edit, id: @contract
     assert_response :success
   end
end
