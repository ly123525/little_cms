class Admin::BaseController < ApplicationController
  layout 'admin'
  include Concerns::AdminSession
  before_action :login
end