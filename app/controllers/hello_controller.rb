class HelloController < ApplicationController
  skip_before_action :verify_authenticity_token

  layout "hello"

  def index
    @header = "layout sample"
    @footer = "copyright MASATO-KOMUKAI 2026."
    @title = "New Layout"
    @msg = "this is sample page!"
  end
end
