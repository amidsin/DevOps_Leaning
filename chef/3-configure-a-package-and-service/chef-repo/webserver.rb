apt_update 'Update apt cache daily' do
	frequency 86_400
	action :periodic
end

package 'nginx'

service 'apache2' do
	supports :status => true
	action [:stop]
end

service 'nginx' do
	supports :status => true
	action [:enable, :start]
end

file '/usr/share/nginx/html/index.html' do
	content '<html>
	<body>
		<h1>hello world</h1>
	<body>
</html>'
end

