#!/bin/bash

txt=$(xclip -o)
cmd='(SayText "'$txt'")'
festival -b "$cmd"
