class WelcomeController < ApplicationController
  
  
  helper :blog_posts
  before_filter :find_page, :find_all_blog_categories
	before_filter :find_all_blog_posts, :except => [:archive]
  before_filter :find_blog_post, :only => [:show, :comment, :update_nav]
  before_filter :find_all_comics
  before_filter :find_page

  respond_to :html, :js, :rss

  def index
  	@comics = Comic.limit(6).order('position ASC')
  	@blog_posts = BlogPost.limit(3).live
  	@header_comic = Comic.most_recent_with_header
  end
	
	protected

  def find_page
    @page = Page.find_by_link_url("/blog")
  end

  def find_all_blog_categories
    @blog_categories = BlogCategory.all
  end	

  def find_blog_post
    unless (@blog_post = BlogPost.find(params[:id])).try(:live?)
      if refinery_user? and current_user.authorized_plugins.include?("refinerycms_blog")
        @blog_post = BlogPost.find(params[:id])
      else
        error_404
      end
    end
  end

  def find_all_blog_posts
    @blog_posts = BlogPost.live.includes(:comments, :categories).paginate({
      :page => params[:page],
      :per_page => RefinerySetting.find_or_set(:blog_posts_per_page, 10)
    })
  end

  def find_all_comics
    @comics = Comic.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/comics").first
  end  

end