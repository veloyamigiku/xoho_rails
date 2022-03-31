class MovieController < ApplicationController
    def now_playing
        now = Date.today
        now_playing = Movie.where('play_started_on <= ?', now)
        render json: now_playing
    end
end
