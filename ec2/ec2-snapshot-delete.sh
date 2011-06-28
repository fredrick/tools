#!/bin/sh
# ec2-snapshot-delete: Deletes the oldest N-th snapshots
# Example (delete the 200th oldest snapshots): ec2-snapshot-delete 200
ec2-describe-snapshots | sort -k 5 | head -$1 | awk '{print "Deleting: " $2; system("ec2-delete-snapshot " $2)}'
