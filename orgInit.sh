#!/bin/bash
# create scratch org using regular definition file
sfdx force:org:create -a aademo -f config/project-scratch-def.json -d 5 -w 10
# deploy the basic configuration
sfdx force:source:deploy -u aademo -m "CustomObject, PermissionSet, CustomApplication, CustomTab, FlexiPage, ApexClass, Layout"
# assign EA admin to admin user
sfdx force:user:permset:assign -u aademo -n EinsteinAnalyticsPlusAdmin
# assign DF19 LMA permset to admin user
sfdx force:user:permset:assign -u aademo -n LMA
# assign DF19 LMA permset to EA integration user using anonymous apex
sfdx force:apex:execute -u aademo -f ./config/assign-lma-permset.apex
# deploy EA components
sfdx force:source:deploy -u aademo -m "WaveDataflow, WaveDataset, WaveLens, WaveApplication, WaveDashboard"
# load sample data
#sfdx force:data:tree:import -p data/account-Account-plan.json -u aademo
sfdx force:data:tree:import -u aademo -p data/version-Package__c-Package_Version__c-plan.json
sfdx force:data:tree:import -u aademo -p data/license-Account-License__c-plan.json

# run apex to send email to reset password
#sfdx force:apex:execute -f config/create-demo-data-setup.apex -u aademo
# open the default scratch org at EA Studio
sfdx force:org:open -u aademo -p /analytics/wave/wave.apexp
