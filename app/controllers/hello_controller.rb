class HelloController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if request.post?
      @title = "Result"
      @msg = "you typed: #{params[:input1]}."
      @value = params[:input1]
      # POST後にリダイレクト（クエリパラメータで値を保持）
      redirect_to action: :index, input1: params[:input1],
        title: @title, msg: @msg
    else
      # パラメータがない場合はデフォルト値を設定
      @title = params[:title] || "Index"
      @msg = params[:msg] || "type text..."
      @value = params[:input1] || ""
    end
  end
end
