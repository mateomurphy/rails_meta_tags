module Rails
  module MetaTags
    class Config
      PROPERTIES.each do |t|
        class_eval "def #{t}(val = nil, &block); self[:#{t}] = val || block; end"
      end

      def initialize(data = nil)
        @data = data || {}
        @instances = {}
      end

      def configure_via_block(block)
        instance_eval(&block)
      end      
    
      def [](tag)
        @data[tag.to_sym]
      end
    
      def []=(tag, value)
        @data[tag.to_sym] = value
      end
    
      def to_hash
        @data.dup
      end
    end
  end
end