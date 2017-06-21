class MarkettingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Contact.find_each do |contact|
    MarkettingMailer.launch_web(Contact.last).deliver_now
    # end
  end
end
