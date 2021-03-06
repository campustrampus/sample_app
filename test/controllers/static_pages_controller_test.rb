require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  def setup
    @title_variable = "| Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home #{@title_variable}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help #{@title_variable}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About #{@title_variable}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact #{@title_variable}"
  end
end
