#!/bin/bash

# using scratch org snapshot
sfdx force:org:create -f config/project-scratch-def.json -a ADK --setdefaultusername -d 1 -w 10

#if not using snapshot, need to break up the build
# deploy the basic configuration
#sfdx force:source:deploy -m "CustomObject, PermissionSet, CustomApplication, CustomTab, FlexiPage, ApexClass, Layout“ -u aamstr00
# assign EA admin to admin user
#sfdx force:user:permset:assign -n EinsteinAnalyticsPlusAdmin -u aamstr00
# assign DF19 LMA permset to admin user
#sfdx force:user:permset:assign -n DF19_LMA -u aamstr00
# assign DF19 LMA permset to EA integration user using anonymous apex
#sfdx force:apex:execute -f ./config/assign-lma-permset.apex -u aamstr00
# deploy EA components
#sfdx force:source:deploy -u aamstr00 -m "WaveDataflow, WaveDataset, WaveLens, WaveApplication“
#
#



sfdx force:apex:execute -f config/create-demo-data-setup.apex
sfdx force:org:open
