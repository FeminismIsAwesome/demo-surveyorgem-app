class AdminController < ApplicationController
  
  def show
    @responses = []
    survey_title = params[:name]
     @survey = Survey.where("title = '#{survey_title}'").first
     @response_set = ResponseSet.where("survey_id = #{@survey.id}")
     @response_set.each do |response|
       
     @responses += Response.where("response_set_id = #{response.id}")
   end
     
  end
  
  def index
    @surveys = Survey.all
  end
end
