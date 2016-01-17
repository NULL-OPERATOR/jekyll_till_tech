desc "Build react.rb library"
task :build_react_app do
  Opal.append_path "react_lib"
  File.binwrite "react_lib.js", Opal::Builder.build("application").to_s
end
