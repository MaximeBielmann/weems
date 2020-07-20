class JobsController < ApplicationController
  def create
    @job = Job.create job_title: params[:job_title], 
                      category_id: params[:category_id],
                      country_id: params[:country_id],
                      job_city: params[:job_city],
                      job_publish_date: DateTime.now,
                      job_salary: params[:job_salary],
                      job_description: params[:job_description]
    redirect_to "/admin"
  end

  def index
    @filterrific = initialize_filterrific(
      Job,
      params[:filterrific],
      select_options: {
        sorted_by: Job.options_for_sorted_by,
        with_country_id: Country.options_for_select,
        with_category_id: Category.options_for_select,
        search_query: Job.options_for_sorted_by,
        sorted_query_city: Job.options_for_sorted_by
      },
      persistence_id: "shared_key",
      default_filter_params: {},
      available_filters: [:with_country_id, :with_category_id, :search_query, :search_city_query],
      sanitize_params: true,
    ) || return
    # Get an ActiveRecord::Relation for all students that match the filter settings.
    # You can paginate with will_paginate or kaminari.
    # NOTE: filterrific_find returns an ActiveRecord Relation that can be
    # chained with other scopes to further narrow down the scope of the list,
    # e.g., to apply permissions or to hard coded exclude certain types of records.
    @jobs = @filterrific.find.page(params[:page])

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end

  # Recover from invalid param sets, e.g., when a filter refers to the
  # database id of a record that doesn’t exist any more.
  # In this case we reset filterrific and discard all filter params.
  rescue ActiveRecord::RecordNotFound => e
      # There is an issue with the persisted param_set. Reset it.
      puts "Had to reset filterrific params: #{e.message}"
      redirect_to(reset_filterrific_url(format: :html)) && return
  end

  def show
    @job = Job.find(params[:id])
  end

  def change
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.update job_title: params[:job_title], 
                      category_id: params[:category_id],
                      country_id: params[:country_id],
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