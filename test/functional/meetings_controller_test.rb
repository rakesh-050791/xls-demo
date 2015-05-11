require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  setup do
    @meeting = meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post :create, meeting: { address: @meeting.address, building: @meeting.building, city: @meeting.city, country: @meeting.country, day: @meeting.day, description: @meeting.description, latitude: @meeting.latitude, longitude: @meeting.longitude, meeting_type: @meeting.meeting_type, name: @meeting.name, owner: @meeting.owner, phone: @meeting.phone, state: @meeting.state, status: @meeting.status, time: @meeting.time, zip: @meeting.zip }
    end

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should show meeting" do
    get :show, id: @meeting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting
    assert_response :success
  end

  test "should update meeting" do
    put :update, id: @meeting, meeting: { address: @meeting.address, building: @meeting.building, city: @meeting.city, country: @meeting.country, day: @meeting.day, description: @meeting.description, latitude: @meeting.latitude, longitude: @meeting.longitude, meeting_type: @meeting.meeting_type, name: @meeting.name, owner: @meeting.owner, phone: @meeting.phone, state: @meeting.state, status: @meeting.status, time: @meeting.time, zip: @meeting.zip }
    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete :destroy, id: @meeting
    end

    assert_redirected_to meetings_path
  end
end
