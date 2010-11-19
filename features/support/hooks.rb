# @author	Christian Trabold <christian.trabold@dkd.de>
# @since 2010-11-18
# @see https://github.com/aslakhellesoy/cucumber/wiki/Hooks

Before('@admin_user') do |scenario, block|
  Factory(:admin_user)
end