require 'active_support/concern'

module Rails
  module MetaTags
    module ControllerMethods
      extend ActiveSupport::Concern
      
      included do
        helper_method :meta
      end
  
      module InstanceMethods
        def meta
          @meta ||= MetaTags.new(view_context)
        end
      end
    end
  end
end