module Jardo
  module Assets
    class << self
      def [](file_name)
        manifest[file_name]
      end

      private

      def manifest
        return @manifest if @manifest

        manifest = JSON.parse(
          File.read(
            File.join(
              File.dirname(__FILE__),
              "../../public/assets/manifest.json"
            )
          )
        )

        if ENV["RACK_ENV"] != "development"
          @manifest = manifest
        end

        manifest
      end
    end
  end
end
