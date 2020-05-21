class JobsController < ApplicationController
  def create
    @job = Job.create job_title: params[:job_title], 
                      job_category: params[:job_category],
                      job_country: params[:job_country],
                      job_city: params[:job_city],
                      job_publish_date: DateTime.now,
                      job_salary: params[:job_salary],
                      job_description: params[:job_description]
    redirect_to "/admin"
  end

  def index
    @jobs = Job.all.page params[:page]
  end

  def show
    @job = Job.find(params[:id])
  end

  def change
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.update job_title: params[:job_title], 
                      job_category: params[:job_category],
                      job_country: params[:job_country],
                      job_city: params[:job_city],
                      job_salary: params[:job_salary],
                      job_description: params[:job_description]
    redirect_to "/jobs/#{params[:id]}"
  end
  
  def apply
    @job = Job.find(params[:id])
  end

  def destroy
    Job.find(params[:id]).destroy
    redirect_to "/jobs"
  end
end