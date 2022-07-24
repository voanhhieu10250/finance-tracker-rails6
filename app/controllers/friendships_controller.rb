class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    flash[:notice] = current_user.save ? 'Following user' : 'There was something wrong with the tracking request'
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = 'Stopped following'
    redirect_to my_friends_path
  end
end
