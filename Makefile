.PHONY: 0-vm 1-fetch 2-prepare shell

0-vm:
	@echo Creating VM...
	multipass launch  -m 2G -d 10G -n bcc

1-fetch:
	@echo Fetching bcc git repo and making it available in VM...
	[ -d bcc ] || git clone https://github.com/iovisor/bcc.git
	multipass mount ${PWD}/bcc bcc://bcc

2-prepare:
	multipass mount ${PWD}/scripts bcc://scripts
	multipass exec bcc sh /scripts/prepare.sh

3-run:
	@echo Afterwards, start a shell with 'make shell' and you should see logs
	multipass exec bcc sudo python3 /bcc/examples/hello_world.py

shell:
	multipass shell bcc
