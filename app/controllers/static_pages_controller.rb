class StaticPagesController < ApplicationController
  def home
  	@entry = current_user.entries.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end

  def com
  end
end
