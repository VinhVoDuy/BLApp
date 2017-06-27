class MarkettingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    i = 0
    Contact.where('(id >= 312 AND id < 315) OR(id >=1133 AND id < 2001) OR (id >= 2081) ').find_each do |contact|
      MarkettingMailer.launch_web(contact).deliver_later(wait: (2.5.minutes * i))
      i += 1
    end
  end
end
