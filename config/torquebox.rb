TorqueBox.configure do
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

