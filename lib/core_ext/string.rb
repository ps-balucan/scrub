class String
    def scrub(*)
        regex = /[a-zA-Z0-9_]/
        
        self.gsub(regex, '*')
    end
end