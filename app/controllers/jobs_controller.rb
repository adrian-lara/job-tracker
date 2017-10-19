class JobsController < ApplicationController
  before_action :set_company, only: [:new, :create, :edit]
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
      @contact = Contact.new
    else
      @jobs = Job.all
      render :independent
    end
  end

  def new
    @job = Job.new()
  end

  def create
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit

  end

  def update
    @job.update(job_params)

    redirect_to company_job_path(params[:company_id], @job)
  end

  def destroy
    @job.destroy

    redirect_to company_jobs_path(params[:company_id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_job
    @job = Job.find(params[:id])
  end

end
