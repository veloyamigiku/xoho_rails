class MovieController < ApplicationController
    def now_playing
        now = params['now']
        if now.nil?
            now_playing = []
        else
            now = Date.parse(now)
            now_playing = Movie.where(play_started_on: now...)
        end
        render json: now_playing
    end
end
