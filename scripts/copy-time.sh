#!/bin/bash
echo $(php --run "echo date('YmdHis');") | xsel -psb
