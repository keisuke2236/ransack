require 'ransack/adapters/active_record/base'

ActiveSupport.on_load(:active_record) do
  extend Ransack::Adapters::ActiveRecord::Base

  if defined?(::Mongoid)
    SUPPORTS_ATTRIBUTE_ALIAS = false
  else
    Ransack::SUPPORTS_ATTRIBUTE_ALIAS =
    begin
      ActiveRecord::Base.respond_to?(:attribute_aliases)
    rescue NameError
      false
    end
  end
end

require 'ransack/adapters/active_record/context'
