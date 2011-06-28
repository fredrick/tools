#!/bin/sh
ec2-describe-snapshots | sort -k 5 | head -$1 | awk '{print "Deleting-> " $2; system("ec2-delete-snapshot " $2)}'
