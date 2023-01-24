class AccessesController < ApplicationController

  def invite
    redirect_to rooms_path
  end

  def uninvite
    redirect_to rooms_path
  end

end