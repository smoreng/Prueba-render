class ApplicationController < ActionController::Base
  Pagy::DEFAULT[:limit] = 10  
  include Pagy::Backend
end
