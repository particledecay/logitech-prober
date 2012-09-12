CC = gcc
CFLAGS = -lX11
INSTALL_PREFIX = /usr/local

xquery-pointer-x: xquery-pointer-x.c
	$(CC) -o $@ $^ $(CFLAGS)

install:
	runner=`whoami`; \
	if test $$runner != "root"; then \
		echo "You are not the root user. Please re-run as root."; \
		exit 1; \
	else \
		echo "Copying xquery-pointer-x to ${INSTALL_PREFIX}/bin/..."; \
		cp xquery-pointer-x ${INSTALL_PREFIX}/bin/; \
		echo "Copying logitech-prober.sh to ${INSTALL_PREFIX}/bin/..."; \
		cp logitech-prober.sh ${INSTALL_PREFIX}/bin/; \
		echo "Setting script to execute upon boot..."; \
		sed -i '/logitech-prober.sh$$/d' /etc/rc.local; \
		sed -i '$$i ${INSTALL_PREFIX}/bin/logitech-prober.sh' /etc/rc.local; \
	fi

uninstall:
	runner=`whoami`; \
	if test $$runner != "root"; then \
		echo "You are not the root user. Please re-run as root."; \
		exit 1; \
	else \
		echo "Removing xquery-pointer-x from ${INSTALL_PREFIX}/bin/..."; \
		rm ${INSTALL_PREFIX}/bin/xquery-pointer-x; \
		echo "Removing logitech-prober.sh from ${INSTALL_PREFIX}/bin/..."; \
		rm ${INSTALL_PREFIX}/bin/logitech-prober.sh; \
		echo "Preventing script execution upon boot..."; \
		sed -i '/logitech-prober.sh$$/d' /etc/rc.local; \
	fi
