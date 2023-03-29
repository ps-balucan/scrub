# :lock: Scrub Tool

Scrub Tool is a cli tool written in Ruby to scrub sensitive PIIs given an input json and sensitive fields

Link to repository: https://github.com/ps-balucan/scrub

## Dependencies
1. Ruby 3.1.0
2. json gem
3. minitest gem
## Installation


Use rvm or your preferred ruby version manager to install and use Ruby 3.1.0

```bash
rvm install 3.1.0
rvm use 3.1.0
```

Download and install gems
```
gem install json
gem install minitest
```

Give the ruby script permissions to run
```
cd path_to_directory
chmod +x scrub
```

## Usage
You can start the ruby script from the terminal

```
# Run this in your terminal
./scrub path_to_sensitive_fields path_to_input
```

This will output a file in your project directory named `output.json`

## Running tests

Existing tests can be ran by running `rake test`

Additional tests can be added by creating a folder in the `/test/test_cases` directory.
Make sure to include an `input.json`, `output.json`, and a `sensitive_fields.txt`. These filenames must be followed for the test to run successfully!
## File examples

input.json - json object that serves as the input to the script
```
{
  "name": "John Doe",
  "email": "jdoe@test.com",
  "id": 1512,
  "phone": "1112223344"
}
```
sensitive_keys.txt - file that stores the names of keys that you want to scrub
```
name
email
phone
```

:warning: Incorrectly formatted inputs will cause the script not to work


## Thoughts for improvement

This section lists down current limitations and my thoughts for improvement as well in this project.
1. Refactor testing suite - the current testing suite just tries to loop through folders existing in the test_cases folder. It would be good to split these out into actual test methods for better maintainability.
2. Error handling - It would vastly improve the user experience if edge cases and the errors arising from them would be bubbled up safely (So the user would know what's wrong as well!)
3. Recursion depth - This would depend on the intended use case of the script but since the tool uses recursion to explore nested objects, a recursion limit may be met. 
4. Add cli flags like -h for command help, and flags for the option to modify output filename
5. ...and a few more I will add