#!/bin/bash

# using scratch org snapshot
sfdx force:org:create -f config/project-scratch-def.json -a ADK -s -d 5 -w 10

# if not using snapshot, need to break up the build
# (comment line 4, uncomment lines 9,11,13,15,17,19,21,23)
# create scratch org using regular definition file
#sfdx force:org:create -f config/project-scratch-orig.json -a aademo --setdefaultusername -d 5 -w 10
# deploy the basic configuration
#sfdx force:source:deploy -m "CustomObject, PermissionSet, CustomApplication, CustomTab, FlexiPage, ApexClass, Layout" -u aademo
# assign EA admin to admin user
#sfdx force:user:permset:assign -n EinsteinAnalyticsPlusAdmin -u aademo
# assign DF19 LMA permset to admin user
#sfdx force:user:permset:assign -n DF19_LMA -u aademo
# assign DF19 LMA permset to EA integration user using anonymous apex
#sfdx force:apex:execute -f ./config/assign-lma-permset.apex -u aademo
# deploy EA components
#sfdx force:source:deploy -u aademo -m "WaveDataflow, WaveDataset, WaveLens, WaveApplication, WaveDashboard"
# load sample accounts
#sfdx force:data:tree:import -u aademo -p data/account-Account-plan.json
# load packages and package versions
#sfdx force:data:tree:import -u aademo -p data/version-Package__c-Package_Version__c-plan.json

# run apex to send email to reset password
sfdx force:apex:execute -f config/create-demo-data-setup.apex
# open the default scratch org at EA Studio
sfdx force:org:open -p /analytics/wave/wave.apexp
