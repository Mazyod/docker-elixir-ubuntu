#!/bin/sh

set -e

cd $PROJECT_ROOT
rm -Rf _build/

mix do \
	local.rebar --force, \
	local.hex --force, \
	compile, \
	release --env=$MIX_ENV
