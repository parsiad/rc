#!/bin/bash

txt=$(xclip -o | tr -d '"'\')
cmd='(SayText "'$txt'")'
festival -b "$cmd"
