class HomeController < ApplicationController
  def index
    @posts = nil
    if user_signed_in?
      current_user.communities.each do |community|
          if @posts.nil?
            @posts = community.posts 
          else  
            @posts += community.posts 
          end 
        end
        @posts = @posts.sort_by(&:created_at).reverse unless @posts.nil?
      end
  end
end
