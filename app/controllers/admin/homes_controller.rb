class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

end
