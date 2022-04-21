require "test_helper"

class MovieControllerTest < ActionDispatch::IntegrationTest
  test "now_playing" do

    get movie_now_playing_path, params: {now: '2022-04-01'}
    assert_response 200
    res = JSON.parse(response.body)
    assert_equal(3, res.length)

    get movie_now_playing_path, params: {now: '2022-04-03'}
    assert_response 200
    res = JSON.parse(response.body)
    assert_equal(2, res.length)

    get movie_now_playing_path, params: {now: '2022-04-15'}
    assert_response 200
    res = JSON.parse(response.body)
    assert_equal(1, res.length)

    get movie_now_playing_path, params: {now: '2022-04-20'}
    assert_response 200
    res = JSON.parse(response.body)
    assert_equal(0, res.length)
    
  end
end
