require "minitest/autorun"
require "./lib/cli"
require "json"

class ScrubTest < Minitest::Test
  TEST_FILES = ['sensitive_fields.txt', 'input.json', 'output.json'].freeze

  def test_invalid_arguments
    empty_input = []

    assert_raises ArgumentError do
      CLI.new(empty_input).run
    end
  end

  def test_given_cases
    #Get the paths of the tests in the test_cases folder
    folders = Dir.entries('./test/test_cases').sort
    folders.delete('.')
    folders.delete('..')

    folders.each do |test_path|
      log_test_name(test_path)

      path_prefix = './test/test_cases/' + test_path + '/'

      key_path = path_prefix + TEST_FILES[0]
      input_path = path_prefix + TEST_FILES[1]
      correct_output_path = path_prefix + TEST_FILES[2]

      CLI.new(input_path, key_path).run

      actual_output = JSON.parse(File.read(TEST_FILES[2]))
      expected_output = JSON.parse(File.read(correct_output_path))

      assert_equal(actual_output, expected_output)
    end


    clean_test_files
  end 

  private
  
  def log_test_name(test_name)
    puts "--------------------------------------------"
    puts "Testing case: " + test_name
    puts "--------------------------------------------"
  end

  def clean_test_files
    File.delete('output.json')
  end

end
