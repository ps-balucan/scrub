require 'json'

require_relative 'core_ext/string'
require_relative 'core_ext/bool'
require_relative 'core_ext/hash'
require_relative 'core_ext/number'
require_relative 'core_ext/array'


class CLI
    attr_accessor :data, :sensitive_keys, :output

    def initialize(data_path, sensitive_keys_path)
        @data = load_file(data_path),
        @sensitive_keys = load_sensitive_keys(sensitive_keys_path)
        @output = nil
    end

    def run
        json = JSON.parse(data[0])
    
        scrub_data(json)

        File.write("output.json", output)
    end

    private

    def load_file(path)
        File.read(path)
    end

    def load_sensitive_keys(path)
        file = File.read(path)

        file.split
    end

    def scrub_data(input_hash)
        result = input_hash.scrub(sensitive_keys, false)

        @output = JSON.pretty_generate(result) + "\n" 
    end
end