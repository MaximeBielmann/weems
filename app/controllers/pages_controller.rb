class PagesController < ApplicationController
  def home
    @jobs = Job.last(4)
  end
  
  def jobs
  end
  
  def contact
  end
  
  def aboutus
  end
  
  def sendcv
  end
  
  def admin
  end
end
