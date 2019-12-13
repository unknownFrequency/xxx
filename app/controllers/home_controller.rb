# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class HomeController < ApplicationController
  before_action :set_user, except: :front
  respond_to :html, :js

  def index
    @post = Post.new
    # @friends = @user.all_following.unshift(@user)
    @friends = User.all
    # @activities = PublicActivity::Activity.distinct
    #   .where(owner_id: @friends).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @activities = PublicActivity::Activity.all.distinct
      .order(created_at: :desc).paginate(page: params[:page], per_page: 5)

    @events = Event.all.distinct
      .where('events.event_datetime >= ?', Date.today)
      .where('events.event_datetime <= ?', Date.today + 31.days)
  end

  def front
    @public_activities = PublicActivity::Activity.distinct
      .joins("INNER JOIN users ON activities.owner_id = users.id")
      .joins('INNER JOIN posts ON activities.trackable_type = "Post"')
      .where("posts.public" => true)
      .order(created_at: :desc)
      .paginate(page: params[:page], per_page: 5)

    @public_events = PublicActivity::Activity.distinct
      .joins("INNER JOIN users ON activities.owner_id = users.id")
      .joins('INNER JOIN events ON activities.trackable_type = "Event"')
      .where('events.event_datetime >= ?', Date.today)
      .where('events.event_datetime <= ?', Date.today + 7.days)
      .paginate(page: params[:page], per_page: 50)


    @private_posts = Post.where(public: false)
      # .reorder('events.event_datetime DESC')
    # @public_events = Event.all.where("event_datetime >= ?", Date.today)


    # @public_activities = PublicActivity::Activity.joins("INNER JOIN users ON activities.owner_id = users.id")
    #   .order(created_at: :desc).paginate(page: params[:page], per_page: 10)
      # .joins("INNER JOIN posts ON activities.trackable_type = 'Post'")
    # @public_activities = []

    # @public_activities.each do |activity|
    #   if activity.trackable_type == "Post"
    #     if Post.find(activity.trackable_id).public
    #       @public_activities.remove activity
    #     end
    #   end
    # end
    # @public_activities = @public_activities.paginate(page: params[:page], per_page: 4)
  end

  def find_friends
    @friends = @user.all_following
    @users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
  end

  private
  def set_user
    @user = current_user
  end
end
