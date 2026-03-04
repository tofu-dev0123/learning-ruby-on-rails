class PeopleController < ApplicationController
  def index
    @msg = "Person data."
    @data= Person.all
  end

  def show
    @msg = "Indexed data."
    @data = Person.find(params[:id])
  end

  def add
    @msg = "add new data."
    @person = Person.new
  end

  def create
    if request.post? then
      Person.create(person_params)
    end
    redirect_to "/people/index"
  end

  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end
end
