# TODO support structured properties
module Rails
  module MetaTags
    module ModelSupport
      autoload :Data, 'rails/meta_tags/model_support/data'
      autoload :DataConfig, 'rails/meta_tags/model_support/data_config'

      extend ActiveSupport::Concern

      # defaults specific to model support
      DEFAULTS = { :title => :to_s, :created => lambda { |r| r.updated_at.strftime('%Y-%m-%d') } }.freeze

      module ClassMethods
        def meta(&block)
          raise "no block given" unless block

          if ancestor = meta_ancestor
            @data = DataConfig.new(ancestor.to_hash)
          else
            @data = DataConfig.new(DEFAULTS.dup)
          end

          @data.configure_via_block(block)
          @data
        end

        def meta_ancestor
          ancestors.each do |ancestor|
            next if ancestor == ModelSupport || ancestor == self
            return ancestor.meta_config if ancestor.respond_to?(:meta_config)
          end
          nil
        end

        def meta_config
          @data || meta_ancestor
        end
      end

      def meta
        self.class.meta_config.instance(self)
      end
    end
  end
end