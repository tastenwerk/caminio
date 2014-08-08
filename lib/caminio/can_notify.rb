# encoding: utf-8
module CanNotify

  extend ActiveSupport::Concern

  module ClassMethods

    def can_notify(options={})

      include InstanceMethods

      cattr_accessor :notification_mailer

      self.notification_mailer = options[:notification_mailer]  || NotificationMailer

    end

  end

  module InstanceMethods

    def notify_on_create
      puts "in there"
      self.notification_mailer.create_notification( self )
    end

    def notify_on_update
      self.notification_mailer.update_notification( self )
    end

    def notify_on_destroy
      self.notification_mailer.destroy_notification( self )
    end

  end

    
end

ActiveRecord::Base.send :include, CanNotify