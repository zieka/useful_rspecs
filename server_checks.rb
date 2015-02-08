describe "Server" do

	it "should be listening on port 80" do
		expect(`sudo netstat -plnt | grep '::80 '`.split).to include("LISTEN")
	end

	it "should be able to resolve and ping 'www.google.com'" do
		expect(`ping -w 1 -c 1 www.google.com`.split(",")).to include(" 1 received")
	end

	it "should be able to resolve and ping 'git'" do
		expect(`ping -w 1 -c 1 git`.split(",")).to include(" 1 received")
	end

	it "should be able to resolve and ping 'smtp.gmail.com'" do
		expect(`ping -w 1 -c 1 smtp.gmail.com`.split(",")).to include(" 1 received")
	end

	it "should have an active link detected on eth0" do
		expect(`ethtool eth0 | grep 'Link detected'`).to eql("\tLink detected: yes\n")
	end

#	it "should have an active link detected on eth1" do
#		expect(`ethtool eth1 | grep 'Link detected'`).to eql("\tLink detected: yes\n")
#	end
end

