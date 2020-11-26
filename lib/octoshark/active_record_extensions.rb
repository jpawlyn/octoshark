module Octoshark
  module ActiveRecordAbstractAdapter
    attr_accessor :connection_name, :database_name

    def log(sql, name = "SQL", *other_args, &block)
      if connection_name || database_name
        name = "[Octoshark: #{[connection_name, database_name].compact.join(' ')}] #{name}"
      end

      super(sql, name, *other_args, &block)
    end
  end
end

ActiveRecord::ConnectionAdapters::AbstractAdapter.send(:prepend, Octoshark::ActiveRecordAbstractAdapter)
