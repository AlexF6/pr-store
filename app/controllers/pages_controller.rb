class PagesController < ApplicationController
  skip_before_action :require_authentication, olny: [ :home ]
  layout "landing", only: [ :home ]

  def home
  end
end
