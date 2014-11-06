require 'test_helper'

class API::V1::TodosControllerTest < ActionController::TestCase
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post :create, todo: { title: "test title", order: 1, completed: false }
      assert_response :success
    end
  end

  test "should update todo" do
    put :update, id: @todo, todo: { title: "test title", order: 1, completed: true }
    assert_response :ok
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete :destroy, id: @todo
      assert_response :ok
    end
  end
end
