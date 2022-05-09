help:
	@echo "Help Menu"

build_image:
	docker build -t dist_dcgan .

dataset:
	mkdir cifar10
	cd cifar10 && wget --no-check-certificate https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
	cd cifar10 && tar -xvf cifar-10-python.tar.gz

experiment:
	./script/run.sh