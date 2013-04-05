#Thanks for notifying to me! I looked the fix and noticed that the fix will not work with old test-unit gem (< 2.4.9) and test/unit that is bundled in Ruby 1.9 or later.
#They don't have Test::Unit::AutoRunner.need_auto_run=.
#Here is a suggested fix that supports older and newer test-unit gems and test/unit bundled in Ruby >= 1.9.3.
#https://github.com/cucumber/cucumber/issues/404
#http://youtrack.jetbrains.com/issue/RUBY-13371

require "test/unit"

if defined?(Test::Unit::AutoRunner.need_auto_run?)
  # For test-unit gem >= 2.4.9
  Test::Unit::AutoRunner.need_auto_run = false
elsif defined?(Test::Unit.run?)
  # For test-unit gem < 2.4.9
  Test::Unit.run = true
elsif defined?(Test::Unit::Runner)
  # For test/unit bundled in Ruby >= 1.9.3
  Test::Unit::Runner.module_eval("@@stop_auto_run = true")
end