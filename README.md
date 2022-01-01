# CIT384-ProxyLab

# We had to creat a dockerfile that contains an Apache web server which uses [ProxyPass Directive](https://httpd.apache.org/docs/2.4/mod/mod_proxy.html) and will do the following.

1. Create the three domains `site1.internal`, `site2.interal` and `site3.internal`. 
1. `site1.internal` will use `ProxyPass` and `ProxyPassReverse` directives to redirect any requests for `/` to `site2.internal`. 
1. Use another Proxy directive in `site1.internal1` to redirect requests for `site1.internal/special` to `site3.internal`. 
1. Force HTTPS for site1 meaning entering the URL `http://site1.internal` will be rewitten to `https://site1.internal`.
1. Make `images` directory in `/home` directory and copy any 3 preferred images to `/home/images` directory.
1. Make `site1.internal` serve images from `/home/images` directory meaning if there is a request for `https://site1.internal/images/my_image1.jpg`, it will be served from `/home/images`.   
