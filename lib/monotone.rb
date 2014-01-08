require 'fileutils'
require 'monitor'
require 'monotone/version'

module Monotone

  extend MonitorMixin

  class << self

    def initialize
      super
    end

    def next( name )
      file(name) do |f|
        value = File.read(f).to_i
        value += 1
        File.write(f, value.to_s )
        value
      end
    end

    def set( name , value )
      file(name) do |f|
        File.write(f, value.to_s)
      end
      value
    end

    private

    def file( name, &block )
      synchronize do
        file = File.join(root_dir, name).tap do |file|
          unless File.file?(file)
            File.write(file, '-1')
          end
        end
        block.yield(file)
      end
    end

    def root_dir
      @dir ||= File.join(ENV['HOME'], '.monotone').tap do |dir|
        unless File.directory? dir
          FileUtils.mkdir_p dir
        end
      end
    end

  end

end
