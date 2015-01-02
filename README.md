# Rainbow-dock

DNS based service discovery for [docker](http://www.docker.com) inspired by [skydock](https://github.com/crosbymichael/skydock).

Rainbow-dock uses [rainbow-dns](https://github.com/asbjornenge/rainbow-dns) combined with something like [dnspop.js](https://gist.github.com/asbjornenge/95a83ea3ffdf083336a2) and :tada: you have a DNS server that can resolve container ip's based on names.

To get started run rainbow-dock

	docker run -p 8080:8080 -p 53:53 -p 53:53/udp -d asbjornenge/rainbow-dock --domain internal.domain --apihost 0.0.0.0 --dnshost 0.0.0.0 --fwdhost 8.8.8.8

The next step is to run [rainbow-dock-populator](https://github.com/asbjornenge/rainbow-dock-populator). It will query your docker host
and populate rainbow-dock with the results.

		docker run -d asbjornenge/rainbow-dock-populator --dockerhost tcp://10.0.0.10:4243

You can now <code>dig @rainbow-dock-container-or-host-ip "*.internal.domain"</code> to retrieve the ip.

To have all your containers use rainbow-dock as their default dns service can be done in two ways. It can either be set on each container individually,
or it can be set on the docker daemon. You can read up on that [here](https://docs.docker.com/articles/networking/#configuring-dns).

	--dns rainbow-dock-container-or-host-ip

And that is all. 

enjoy.