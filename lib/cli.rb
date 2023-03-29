require 'json'

class CLI
    attr_accessor :data, :sensitive_keys, :output

    def initialize(data_path, sensitive_keys_path)
        @data = load_file(data_path),
        @sensitive_keys = load_sensitive_keys(sensitive_keys_path)
        @output = nil
    end

    def run
        raise NotImplementedError
    end

    private

    def load_file(path)
        File.read(path)
    end

    def load_sensitive_keys(path)
        file = File.read(path)

        file.split
    end
end