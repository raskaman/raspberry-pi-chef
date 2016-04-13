nginx_rtmp_url = node['nginx_rmtp']['source']['url']
src_path = "/tmp/nginx-rmtp"

git src_path do
  repository nginx_rtmp_url
  reference "master"
  action :sync
end

bash "compile_nginx_rtmp_source" do
  cwd ::File.dirname(src_path)
  code <<-EOH
    ./configure --add-module=/root/nginx/nginx-rtmp-module/ --with-http_ssl_module --prefix=/usr/local/nginx-streaming/
    make && make install
    rm -rf #{src_path}
  EOH
end

