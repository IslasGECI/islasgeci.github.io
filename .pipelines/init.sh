#!/usr/bin/env bash
git config --get core.hooksPath
git config core.hooksPath .githooks
git config --get core.hooksPath
