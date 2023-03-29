class Array
    def scrub(key_list, is_sensitive)
        self.each_with_index do |element, index|
            if [Hash, Array].include?(element.class) || is_sensitive
                self[index] = element.scrub(key_list, is_sensitive)
            end
        end
    end
end