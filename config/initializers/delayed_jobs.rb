unless Rails.env.test? || Rails.env.ticket_app?
  # config/initializers/delayed_job_config.rb
  Delayed::Worker.destroy_failed_jobs = false
  Delayed::Worker.sleep_delay = 10
  Delayed::Worker.max_attempts = 3
  Delayed::Worker.max_run_time = 5.minutes
  Delayed::Worker.read_ahead = 10
  Delayed::Worker.default_queue_name = 'caminio-task'
  Delayed::Worker.delay_jobs = !Rails.env.test?
  Delayed::Worker.raise_signal_exceptions = :term
  Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
end