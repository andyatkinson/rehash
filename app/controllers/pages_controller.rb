class PagesController < ApplicationController
  before_filter :require_admin, :except => [:show]
  
  make_resourceful do
    actions :all
  end
end
