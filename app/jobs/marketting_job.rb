class MarkettingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Contact.find_each do |contact|
      MarkettingMailer.launch_web(contact).deliver_now
    end
  end
end
