TorqueBox.configure do
 environment do
    GEM_HOME "#{ENV['rvm_path']}/gems/jruby-1.7.4@mhtest"
    GEM_PATH "#{ENV['rvm_path']}/gems/jruby-1.7.4@mhtest:#{ENV['rvm_path']}/gems/jruby-1.7.4@global"
  end

  web do
    context "/mhtest"
    host "shire.commongroundpublishing.com"
    static "public"
  end

  ruby do
    version "1.9"
    compile_mode "jit"
    debug false
    interactive true
    profile_api true
  end
end
