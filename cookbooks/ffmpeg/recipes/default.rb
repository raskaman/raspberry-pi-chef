codec_url = node['ffmpeg']['codec']['git_repository']
git_url = node['ffmpeg']['git_repository']
src_path = "/tmp/codec"
ffmpeg_src_path = "/tmp/ffmpeg"

git src_path do
  repository codec_url
  reference "master"
  action :sync
end

bash "compile_codec" do
  cwd ::File.dirname("/tmp/codec/x264")
  code <<-EOH
  	./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl
	make -j4
	sudo make install
  EOH
end

git ffmpeg_src_path do
  repository git_url
  reference "master"
  action :sync
end

bash "compile_ffmpeg" do
  cwd ::File.dirname("/tmp/ffmpeg/ffmpeg")
  code <<-EOH
  	sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree
	make -j4
	sudo make install
  EOH
end