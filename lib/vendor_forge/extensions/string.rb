module VendorForge
  module Extensions
    module String

      def slugerize
        self.gsub(/[^a-zA-Z0-9\-\_\s]/, ' ').gsub(/\s+/, '-')
      end

    end
  end
end
