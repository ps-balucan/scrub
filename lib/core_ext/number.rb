class Integer
    def scrub(*)
        string_integer = self.to_s

        string_integer.scrub
    end
end

class Float
    def scrub(*)
        string_float = self.to_s

        string_float.scrub
    end
end