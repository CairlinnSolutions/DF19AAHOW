#!/bin/bash

sfdx force:org:create -f config/project-scratch-def.json -a ADK --setdefaultusername -d 1

sfdx force:source:push 

#sfdx assign permission sets

#sfdx 

sfdx force:apex:execute -f config/create-demo-data-setup.apex

sfdx force:org:open