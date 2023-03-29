class Hash
    def scrub(key_list, is_sensitive)
        self.each do |key, value|
            if key_list.include?(key) || is_sensitive
                self[key] = self[key].scrub(key_list, true)
            elsif [Hash, Array].include?(value.class)
                self[key] = self[key].scrub(key_list, is_sensitive)
            end
        end
    end
end