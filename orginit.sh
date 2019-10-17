#!/bin/bash

# using scratch org snapshot
sfdx force:org:create -f config/project-scratch-def.json -a ADK --setdefaultusername -d 1 -w 10

#not needed since using scratch org snapshot
#sfdx force:source:push 

sfdx force:apex:execute -f config/create-demo-data-setup.apex

sfdx force:org:open