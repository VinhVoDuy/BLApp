class MarkettingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Contact.find_each do |contact|
      sleep 300
      MarkettingMailer.launch_web(contact).deliver_later
    end
  end
end
