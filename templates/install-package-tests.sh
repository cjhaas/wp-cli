#!/usr/bin/env bash

WP_CLI_DIR=${WP_CLI_DIR-/tmp/wp-cli}

set -ex

install_wp_cli_suite() {

	# Set up WP-CLI
	if [ ! -d $WP_CLI_DIR ]
		then
			git clone --quiet -b scaffold-package-tests https://github.com/wp-cli/wp-cli.git $WP_CLI_DIR
			cd $WP_CLI_DIR
			curl -sS https://getcomposer.org/installer | php
			chmod +x composer.phar
			./composer.phar install
	else
		cd $WP_CLI_DIR
		git pull
	fi
}

install_wp_cli_suite