#!/bin/bash

# create scratch org using regular definition file
sfdx force:org:create -f config/project-scratch-def.json -a aademo -d 5 -w 10
# deploy the basic configuration
sfdx force:source:deploy -m "CustomObject, PermissionSet, CustomApplication, CustomTab, FlexiPage, ApexClass, Layout" -u aademo
# assign EA admin to admin user
sfdx force:user:permset:assign -n EinsteinAnalyticsPlusAdmin -u aademo
# assign DF19 LMA permset to admin user
sfdx force:user:permset:assign -n DF19_LMA -u aademo
# assign DF19 LMA permset to EA integration user using anonymous apex
sfdx force:apex:execute -f ./config/assign-lma-permset.apex -u aademo
# deploy EA components
sfdx force:source:deploy -m "WaveDataflow, WaveDataset, WaveLens, WaveApplication, WaveDashboard" -u aademo
# load sample accounts
sfdx force:data:tree:import -p data/account-Account-plan.json -u aademo
# load packages and package versions
sfdx force:data:tree:import -p data/version-Package__c-Package_Version__c-plan.json -u aademo

# run apex to send email to reset password
#sfdx force:apex:execute -f config/create-demo-data-setup.apex -u aademo
# open the default scratch org at EA Studio
sfdx force:org:open -p /analytics/wave/wave.apexp -u aademo
