require 'fileutils'
require 'pathname'

module Ecogem
  class Gemfile
    class Source
      attr_reader :git

      def initialize(dependency, data)
        @dependency = dependency
        @data = data
      end

      def git?
        @data && @data.options.key?('git')
      end

      def path?
        @data && @data.options.key?('path')
      end

      def source?
        @data && @data.options.key?('remotes')
      end

      def git_uri
        @data.options['git']
      end

      def path
        @path ||= ::File.expand_path(@data.options['path'].to_s, @dependency.gemfile.dir)
      end

      def relative_path
        @relative_path ||= ::Pathname.new(path).relative_path_from(::Pathname.new(@dependency.gemfile.dir)).to_s
      end

      def source
        @data.options['remotes'][0]
      end

      def ref
        @data.ref
      end

      def git_source
        @git_source ||= ::Ecogem::Git.new(git_uri, ref)
      end

      def path_source
        @path_source ||= ::Ecogem::Path.new(path)
      end

      def code
        @code ||= begin
          if git?
            "path: Ecogem.git_path(#{git_source.key.inspect})"
          elsif path?
            "path: #{relative_path.inspect}"
          elsif source?
            "source: #{source.inspect}"
          end
        end
      end
    end
  end
end